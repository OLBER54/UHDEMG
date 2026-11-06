#include "../src/led_pattern.h"
#include <iostream>
#include <stdexcept>

void require(bool condition, const char* message)
{
    if (!condition) throw std::runtime_error(message);
}

int main()
{
    // Test all 256 port combinations over two complete slow-blink cycles.
    for (int mask = 0; mask < 256; ++mask) {
        std::array<bool, 8> ports{};
        for (int port = 0; port < 8; ++port)
            ports[port] = (mask & (1 << port)) != 0;
        std::array<int, 4> onMilliseconds{};
        std::array<int, 4> risingEdges{};
        auto previous = connectionLedPattern(ports, 3999);
        for (int ms = 0; ms < 4000; ++ms) {
            const auto leds = connectionLedPattern(ports, ms);
            require(leds[4] == 1, "Connection LED must stay on");
            require(leds[5] == 0 && leds[6] == 0 && leds[7] == 0,
                    "Unassigned LEDs must stay off");
            require(leds == connectionLedPattern(ports, ms + 4000),
                    "Pattern must repeat without drift");
            for (int pair = 0; pair < 4; ++pair) {
                onMilliseconds[pair] += leds[pair];
                if (leds[pair] && !previous[pair]) ++risingEdges[pair];
            }
            previous = leds;
        }
        for (int pair = 0; pair < 4; ++pair) {
            const bool first = ports[2 * pair], second = ports[2 * pair + 1];
            const int expectedOn = first && second ? 4000 : (first || second ? 2000 : 0);
            const int expectedCycles = first == second ? 0 : (first ? 2 : 8);
            require(onMilliseconds[pair] == expectedOn, "Incorrect steady state or duty cycle");
            require(risingEdges[pair] == expectedCycles, "Incorrect blink frequency");
        }
    }
    std::array<bool, 8> ports{{true, false, false, true, false, false, true, true}};
    require(connectionLedPattern(ports, 249)[1] == 1, "Fast blink must be on for 250 ms");
    require(connectionLedPattern(ports, 250)[1] == 0, "Fast blink must switch at 250 ms");
    require(connectionLedPattern(ports, 999)[0] == 1, "Slow blink must be on for 1000 ms");
    require(connectionLedPattern(ports, 1000)[0] == 0, "Slow blink must switch at 1000 ms");
    std::cout << "All 256 combinations, blink frequencies, duty cycles and boundaries passed.\n";
}
