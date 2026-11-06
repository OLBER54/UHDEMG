#ifndef RHD_LED_PATTERN_H
#define RHD_LED_PATTERN_H

#include <array>
#include <cstdint>

// elapsedMs is measured from connection using a monotonic clock.
// Port usage means a configured patch count greater than zero.
inline std::array<int, 8> connectionLedPattern(
    const std::array<bool, 8>& ports, std::int64_t elapsedMs)
{
    std::array<int, 8> leds{};
    for (int pair = 0; pair < 4; ++pair) {
        const bool first = ports[2 * pair];
        const bool second = ports[2 * pair + 1];
        if (first && second)
            leds[pair] = 1;
        else if (first)
            leds[pair] = (elapsedMs % 2000) < 1000; // 0.5 Hz: 1 s on, 1 s off
        else if (second)
            leds[pair] = (elapsedMs % 500) < 250;   // 2 Hz: 250 ms on, 250 ms off
    }
    leds[4] = 1; // Connected. LEDs 5-7 remain off.
    return leds;
}

#endif
