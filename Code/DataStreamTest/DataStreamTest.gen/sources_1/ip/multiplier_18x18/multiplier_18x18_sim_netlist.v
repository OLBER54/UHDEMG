// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Jun 15 15:19:22 2026
// Host        : LAPTOP-H85DCTKA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/olivi/Documents/Universite
//               Laval/Maitrise/DataStreamTest/DataStreamTest.gen/sources_1/ip/multiplier_18x18/multiplier_18x18_sim_netlist.v}
// Design      : multiplier_18x18
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "multiplier_18x18,mult_gen_v12_0_24,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_24,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module multiplier_18x18
   (A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_mode = "slave a_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_mode = "slave b_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_mode = "master p_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [35:0]P;

  wire [17:0]A;
  wire [17:0]B;
  wire [35:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [47:0]NLW_U0_PCASC_EXT_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "35" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "SOFT" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  multiplier_18x18_mult_gen_v12_0_24 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(1'b1),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .PCASC_EXT(NLW_U0_PCASC_EXT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
I910e7jbNfN24pXwaCSMxqVj2Ezdrkc8axWPNPWLuy5wJ6bYPjUJrhdK8hBm+XPeTfSb0PTJnr/x
Krh166hfPPBlnnedvQG+2p32cWWYI3Jj65CR+tqidiJhdw+jpdAT0O+tDHpXQu8A715yy0ruF+zv
LSutZic4CGaPqXPBU+8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tOTzBjh2SQO+2QgYvLGd62ippBEfpJwpHWAs9rrdHUwvGwbeByaqaz/HRw7rWSQh2FikidsOXzr9
VD97c5jdR48paYWB1lmdqeF488Y2jMQc2CwReC98nLpXFukShKI4sr8QK6t5sXjT/4HYezgr4Xix
zIwRKQ1ReXHO6ZNomuErKJjpFX/dn+5LT6Db5SVulrxL68ljashRqDeA7GMw4huo8xcNtxNV7xfb
oM1HgdoJhhqlb568nKX6+jaWGr9fZIRKoMH0vO/miKYJLOeWxNZ2Pgg700CXwOC83/aikmVGhgh1
jM3HpBk8aDp5Y21A0Fpp3kUhyZs4OUFcsj/y1g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
EdEhYfxGLALWwz2A8RKGvmueJD2fHEVu9+KVbTSsUS32VnYoGnc14W6BjgM+aVdYFrvvOwQeTUpz
FZfb+sLXywNHm+adAV+xzqk1XvcJNt3VN2sycpXJY+68+tjH7IHZQ+8yRbqaYWnZVqJ90vR6XR0X
740D0LE2a3P59lGmu8Y=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qt/YSLKDmd7omBa2uY94RAUTN1YLtqMWhKZeF+FJccA6f+2IUvNFUb8VA+KvnOSWUfsIQ7ouGGSq
YzcNlVicCVvt/gv4b6dmyYXQ4pL8mISaNILUIDeJNsWNTft/hNt9Bp0lHqYr11R1miAo9TtM2l3b
UyQMH1aTUeEet6GtapPYFdaHR2DKzB9jvbi88vlPO9oz+QLneWzbOIs1SzJ49DV8fgNn4vi2PFqG
ENgTkZlveIrHMdk6vzm9wQQXQaXCNfLgWB+Y40/wwfO1ZstKHKuradIIvAQhEEKN0IGu3/bTl90D
UZLzQQibBYsl2VYsSLXf0dIMGIckVgiTbJRSGg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
u1LIH9BQ8X3la7q6da9Mzh6T4U6V+HvvkBBm4C+CQe7BF/eBwPNxSzxvZE/x0TG1c8bvOXRTxnmu
a+0ZGsqq5IqVTbQhfDEg9Y+gJz1IM8WMwqLVsmHSeUbpbnwngKoUbNQOQv1WRyNGnv4F/jI81nYX
HuXFyE2NVHTTMzCin34fKPiwVDQ+UzNTcayDrnU1CY+Udoh45KlE1l6+28uLuAnW4ACdWWr8ESLq
DR4dRp1oHvaNlXUK7vcnJ2+Ov/qLQc+1QeJeSM9svqPNs448IswOzIlk1ulhQh87kpwdHV2gdfSS
ekFaViYIKna0lus0TnUUqCwF9aOemBIgOBGm5w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ThGX7m1wupKmfjpeSuERSB+T7gquJSX6tq2xggUCrpUGHebhya8nWjMujArHTtZh6oUVb0QX8VDf
NRFTTfQ29w/ozh6fTrTQ/PrboWzdLkaABpPNVyeMStlulCCsemZUduRW3R2l8qEq44TVZcrL3NLq
NQtvyT88wqSWUs/Ly+3bbOMwCFcUyreYECd3L7sFTekvmjgOzseWEkUqi5rYpFaoe2fIKBy3/i1I
IEhb5HNd3/4wBVm4JzwGU7MCwr7IHJ+wDpOVyuwb3lRK0uCKTbMLrXrLR6ETYzaSjx46bNWzWnZS
2jU9OaYlTxamZSRRC0tPHBB4HPVPLAdW2y8kLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
H2BVuF6JPvdByoK1aCz7p5WLhtbYDEDat4vaF1+IGCqBNuCgU7ZEckdQrjRNgyLbBCuGUhV2/Z87
7zmLyvPKp31qiGE62Z1rxDDY/8uPTNJmHChiPtJdrxtM+doqnoh6vftv5e+5o/fBrPH19+yBL2Nh
Z5fckSgZhFQ68P5dQuOkyIC5tp3R/HOnMjpG2xTMeS1yDGuFnYHA32VMFhXbyJbD4Mp5jVlQzwLs
6CrhAWWd7oBlxQ1e6DiDkbPQI12utFzvD/zshqm0HKUZY7YNRVE4UKGU+0MUAEr2tYE/KkaHSWmA
hTE0pwWLvrn0T5ldb6JKisPFcCRFq1RseLqKnQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
KkmCCcPhzWVUpuyH7mDH/kWvZLU9F0bZj+FB6hEDWav7aepDlW40mXmjmlsPTq6UcrVxN2LRWKt6
aT20LRSTKTlRlh29oiVlGDyITvP4mqCOoNs5Jiye2gmf1rtBW2DXoysXfomK0SypsNpy8fNr18hG
57a6lvuAP8Rh6q4wDGslM3Xbu71JJk1C9lVARGmzGP/mJtvA3iedWC4Tg+7BrLO09FZ7ldiVfJlT
0wy6cQym8l60VY5SIWLLj1XoUbZONTLU3WT1lFs/tFqN1JtonQ6ZZg2qYEghgeAPL9/Gl6cdPPu3
wM+ETD/nD5LRfYZVM7Lb0ejBBAeKcAOOf+zbgXO7T24PqmwUerrefHxeVSb3oha6vCHiAnoRYuVp
Dxfq2ra9dO9LNsuPs03zR7rLLuvCmwUWqSB0+2Z9pTbpt7A4T5Fd0OLa4rDFr3LbFDf16sdDy0pK
tatqXYi/+Ytep9KZh2jjoxEetd1MLAo+Wd8Diu78IMAH3TBsO6hlYVqa

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HlVefHqF6PMcC1QL4S6isRBBHrYDmuMKO68bwPID8DHMq9J2gPyVJo7oVhVhhh/uz4wr3XtJJrKV
kdSwhQxSbtiGD1Kme1G1EM2+tBEkDFjVnc5txT6Yz39JXmjVlokngCLa0jPfnQEDMSQLLctVLqHB
Y71YHEhdjR03f/ErlbzbJzk4954gXndSJ8W1+1CE6C/Q7JLvBQOes3Wdhx23NEFrPR+xF1JYErJB
MujUqjm2zC8WprwOfluOLYlb3C28uYfcybHvDfG9S+h5HezEzSBVtUh+EUlY65Ug4b4MZDbpMdHt
514c4v/RlO+5c67z0QhV9n8iVnzPoHkifYzPPA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GElKnNwHuDvUsC6n3ryq1yJlBpsGEgpqhJaMewBzWoI0ABOCOmkYXeVvVaght1MSSYlMMh/2kUno
8CMZ0oTtGoAOaDOj+2b/ipMpLfar6QSptPGGS1BDIyibKaIF995HpywP+JaSmoIUypZPu4EGqqUl
irumZXlXoi0CgR7fBMJk6fsFsv/H48YZEAvFSUqWN5RWtWqhFOCVJwjRB9qYv4Cz4znFjCSXHePO
3WhFhxbYdkg//WZm/i7Na8UEwV7skIyx4snZFQN3StEshEhlus9bZj0WaMhL/q3Qi5M5e0kvS+a2
TBIb31t89nzvzCVXX2TsVZQIOU1xjM22qEBd+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NvC4x0gmKiuZSBSnTCrYtP8VEcCHfYyFLPcOc7hcUGPwtoKZrCGumU4YJspQ4iyC4Ibe0vTPscVD
/EaTDg0G/qI5OV8V47s1r/8smLOrXQSKWcxqeT5UVy9c6GKlRKrC6ZskdRUI9wGVAliaeOeKbxqH
XR/4p0oMdtKBZdUEbyq2aZwf72LyBc6m5qbtV0bvdoCpJkLSCsRngzpyOKuDTUsZ//SwGnpt48W1
+Yrwea91WokwKvPn196R8ZLc0VmvRaNX+g8o4/P211VZMgur2tNI6ndi2tdu0/pQYQEHOxzwHvKg
qf9EnC05euLrpDCFshQjmyblT8x0L9rUTmfNSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5728)
`pragma protect data_block
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
mOUJcpVvxX6DWBQC3hOxJ0cFlg9F4m4eEkjbqw==
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
I910e7jbNfN24pXwaCSMxqVj2Ezdrkc8axWPNPWLuy5wJ6bYPjUJrhdK8hBm+XPeTfSb0PTJnr/x
Krh166hfPPBlnnedvQG+2p32cWWYI3Jj65CR+tqidiJhdw+jpdAT0O+tDHpXQu8A715yy0ruF+zv
LSutZic4CGaPqXPBU+8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tOTzBjh2SQO+2QgYvLGd62ippBEfpJwpHWAs9rrdHUwvGwbeByaqaz/HRw7rWSQh2FikidsOXzr9
VD97c5jdR48paYWB1lmdqeF488Y2jMQc2CwReC98nLpXFukShKI4sr8QK6t5sXjT/4HYezgr4Xix
zIwRKQ1ReXHO6ZNomuErKJjpFX/dn+5LT6Db5SVulrxL68ljashRqDeA7GMw4huo8xcNtxNV7xfb
oM1HgdoJhhqlb568nKX6+jaWGr9fZIRKoMH0vO/miKYJLOeWxNZ2Pgg700CXwOC83/aikmVGhgh1
jM3HpBk8aDp5Y21A0Fpp3kUhyZs4OUFcsj/y1g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
EdEhYfxGLALWwz2A8RKGvmueJD2fHEVu9+KVbTSsUS32VnYoGnc14W6BjgM+aVdYFrvvOwQeTUpz
FZfb+sLXywNHm+adAV+xzqk1XvcJNt3VN2sycpXJY+68+tjH7IHZQ+8yRbqaYWnZVqJ90vR6XR0X
740D0LE2a3P59lGmu8Y=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qt/YSLKDmd7omBa2uY94RAUTN1YLtqMWhKZeF+FJccA6f+2IUvNFUb8VA+KvnOSWUfsIQ7ouGGSq
YzcNlVicCVvt/gv4b6dmyYXQ4pL8mISaNILUIDeJNsWNTft/hNt9Bp0lHqYr11R1miAo9TtM2l3b
UyQMH1aTUeEet6GtapPYFdaHR2DKzB9jvbi88vlPO9oz+QLneWzbOIs1SzJ49DV8fgNn4vi2PFqG
ENgTkZlveIrHMdk6vzm9wQQXQaXCNfLgWB+Y40/wwfO1ZstKHKuradIIvAQhEEKN0IGu3/bTl90D
UZLzQQibBYsl2VYsSLXf0dIMGIckVgiTbJRSGg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
u1LIH9BQ8X3la7q6da9Mzh6T4U6V+HvvkBBm4C+CQe7BF/eBwPNxSzxvZE/x0TG1c8bvOXRTxnmu
a+0ZGsqq5IqVTbQhfDEg9Y+gJz1IM8WMwqLVsmHSeUbpbnwngKoUbNQOQv1WRyNGnv4F/jI81nYX
HuXFyE2NVHTTMzCin34fKPiwVDQ+UzNTcayDrnU1CY+Udoh45KlE1l6+28uLuAnW4ACdWWr8ESLq
DR4dRp1oHvaNlXUK7vcnJ2+Ov/qLQc+1QeJeSM9svqPNs448IswOzIlk1ulhQh87kpwdHV2gdfSS
ekFaViYIKna0lus0TnUUqCwF9aOemBIgOBGm5w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ThGX7m1wupKmfjpeSuERSB+T7gquJSX6tq2xggUCrpUGHebhya8nWjMujArHTtZh6oUVb0QX8VDf
NRFTTfQ29w/ozh6fTrTQ/PrboWzdLkaABpPNVyeMStlulCCsemZUduRW3R2l8qEq44TVZcrL3NLq
NQtvyT88wqSWUs/Ly+3bbOMwCFcUyreYECd3L7sFTekvmjgOzseWEkUqi5rYpFaoe2fIKBy3/i1I
IEhb5HNd3/4wBVm4JzwGU7MCwr7IHJ+wDpOVyuwb3lRK0uCKTbMLrXrLR6ETYzaSjx46bNWzWnZS
2jU9OaYlTxamZSRRC0tPHBB4HPVPLAdW2y8kLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
H2BVuF6JPvdByoK1aCz7p5WLhtbYDEDat4vaF1+IGCqBNuCgU7ZEckdQrjRNgyLbBCuGUhV2/Z87
7zmLyvPKp31qiGE62Z1rxDDY/8uPTNJmHChiPtJdrxtM+doqnoh6vftv5e+5o/fBrPH19+yBL2Nh
Z5fckSgZhFQ68P5dQuOkyIC5tp3R/HOnMjpG2xTMeS1yDGuFnYHA32VMFhXbyJbD4Mp5jVlQzwLs
6CrhAWWd7oBlxQ1e6DiDkbPQI12utFzvD/zshqm0HKUZY7YNRVE4UKGU+0MUAEr2tYE/KkaHSWmA
hTE0pwWLvrn0T5ldb6JKisPFcCRFq1RseLqKnQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
KkmCCcPhzWVUpuyH7mDH/kWvZLU9F0bZj+FB6hEDWav7aepDlW40mXmjmlsPTq6UcrVxN2LRWKt6
aT20LRSTKTlRlh29oiVlGDyITvP4mqCOoNs5Jiye2gmf1rtBW2DXoysXfomK0SypsNpy8fNr18hG
57a6lvuAP8Rh6q4wDGslM3Xbu71JJk1C9lVARGmzGP/mJtvA3iedWC4Tg+7BrLO09FZ7ldiVfJlT
0wy6cQym8l60VY5SIWLLj1XoUbZONTLU3WT1lFs/tFqN1JtonQ6ZZg2qYEghgeAPL9/Gl6cdPPu3
wM+ETD/nD5LRfYZVM7Lb0ejBBAeKcAOOf+zbgXO7T24PqmwUerrefHxeVSb3oha6vCHiAnoRYuVp
Dxfq2ra9dO9LNsuPs03zR7rLLuvCmwUWqSB0+2Z9pTbpt7A4T5Fd0OLa4rDFr3LbFDf16sdDy0pK
tatqXYi/+Ytep9KZh2jjoxEetd1MLAo+Wd8Diu78IMAH3TBsO6hlYVqa

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HlVefHqF6PMcC1QL4S6isRBBHrYDmuMKO68bwPID8DHMq9J2gPyVJo7oVhVhhh/uz4wr3XtJJrKV
kdSwhQxSbtiGD1Kme1G1EM2+tBEkDFjVnc5txT6Yz39JXmjVlokngCLa0jPfnQEDMSQLLctVLqHB
Y71YHEhdjR03f/ErlbzbJzk4954gXndSJ8W1+1CE6C/Q7JLvBQOes3Wdhx23NEFrPR+xF1JYErJB
MujUqjm2zC8WprwOfluOLYlb3C28uYfcybHvDfG9S+h5HezEzSBVtUh+EUlY65Ug4b4MZDbpMdHt
514c4v/RlO+5c67z0QhV9n8iVnzPoHkifYzPPA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GElKnNwHuDvUsC6n3ryq1yJlBpsGEgpqhJaMewBzWoI0ABOCOmkYXeVvVaght1MSSYlMMh/2kUno
8CMZ0oTtGoAOaDOj+2b/ipMpLfar6QSptPGGS1BDIyibKaIF995HpywP+JaSmoIUypZPu4EGqqUl
irumZXlXoi0CgR7fBMJk6fsFsv/H48YZEAvFSUqWN5RWtWqhFOCVJwjRB9qYv4Cz4znFjCSXHePO
3WhFhxbYdkg//WZm/i7Na8UEwV7skIyx4snZFQN3StEshEhlus9bZj0WaMhL/q3Qi5M5e0kvS+a2
TBIb31t89nzvzCVXX2TsVZQIOU1xjM22qEBd+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NvC4x0gmKiuZSBSnTCrYtP8VEcCHfYyFLPcOc7hcUGPwtoKZrCGumU4YJspQ4iyC4Ibe0vTPscVD
/EaTDg0G/qI5OV8V47s1r/8smLOrXQSKWcxqeT5UVy9c6GKlRKrC6ZskdRUI9wGVAliaeOeKbxqH
XR/4p0oMdtKBZdUEbyq2aZwf72LyBc6m5qbtV0bvdoCpJkLSCsRngzpyOKuDTUsZ//SwGnpt48W1
+Yrwea91WokwKvPn196R8ZLc0VmvRaNX+g8o4/P211VZMgur2tNI6ndi2tdu0/pQYQEHOxzwHvKg
qf9EnC05euLrpDCFshQjmyblT8x0L9rUTmfNSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8416)
`pragma protect data_block
8ll4PtALrsTYa9hGuxW2q9gQyz8SPHEvR8/d7ywRfI2AeJroIM4YHGyIdHZEQ65c6T46PuZemRdI
NefRaAA2vq+QnBklpy/xn+VlLMPIN+Z4qc2MrcSx9XSAID4Tp6FVNiNZSvpLsXweU3RM+1j2Ww0e
Pzjn4dodnD648Rznq/J46y0AlQDFkiuEdymOER1zRWh45hHnFyI1rLEW0DYxz4n9MQQqYQ0RjIJM
KNaERRfsqgdvdXhDSsoniLa/Vuj0TpvMLbQjH8PqbwCs4Tk5wcO5rdadLga2Ufmb5gKE1sJcA1bl
FIXOdHmoLlbEECF9+Zk8+OepMcmXC2qLG2wWlNp4/g6alqnvleIQ93g2kTf1fD+4CDaKDVitKLl+
1hu5R/ijbmtk2VW5EBAjzI/Ze0oatfekOQ2fe0feTphnHqMVK6LSLEe6zXVLV7r6DJoubqLAvSvJ
atdZUDPevp1ZMcRBcJk4F6MCezFJmN5/m4St1+mdEqMEcINmXxv89qnboD7i1XPwVy1GfhC147nj
XR4CwtNVe21hnfx/UZz2/VGW3ALAnQAxKOjayrAKpihwcN/PyN6S9ylDzbdmj3lgLBS4PDTHwf/x
hDzHDhIlLMC0GMBz5gXQ611V/qTtxng7e2P4YSfu0agrFS+Hd687lyqc7luASGiuVXUp6S6voOaD
ZLaMgbIr8bUup4zsz0DMk4VPayLf5EgDVwK5ar/bNKD2jlBSB3j/nFRwcfD2hwZsX8jyakrX0xWB
r8LwPrT7o+tQiYKXlZilyJOjhX34v6WHe1jEXBoAH6jYCCAfF8piZB8VL3/sC5G9XZZB7fwPNNBY
0ERaXX5HeSdcMifiZ13jy8fOhkgq1RkBkjzgEqLe0SqxkpdmZwiduCMfdYugqabvuoIcDqfeCEGY
RijhRKwz3NG0O6hel1/UWnf6WlKbrx1vmyY40k7kjl5FarbajEKYtWThE9lP5xP4iia0SnYSkQAD
X8kJFpAkBkzhDhYw/Jr8BYW66j8CNsIBQKtio+EukLjoB/gAJxPuZ+PwY+03dK/7/gNkYZeF1wDp
qKkbNqLGCh5qxM8xb/EWhAcpw7pc3TnZ8Qi5SibUoz9cUthIVvu/XK6dMEcw2XRphG4DD+OX52d8
Hd1RXMIq4AZRHjR7iepYvQzGnjhBnvv3aykaMfe8ph7cfkfbepY/Pus1Clbo8AJPm0mn2rNX8nWL
9fiKvSPRutx7hJIFcT7Zlz7rbuFNwnPcQiLv0SMztApiaQjQTMaPRBMXndNn0rPzCTzpPX6rU1Gf
51wT4wt4XaTgDcYzisyKwrL2PRCF41xr52CQb+l0dM2FKMD4GlFD3LYtfpeScc7lMuH42vyVkxLn
0Epg/QLb4nHmY6nvGysOneLMWBrSkRJE2MafnYc+c2V0M1qk0jZZ6VeUD4v69LBmehxeTIR1sPrw
QpRKAH0m+7npOqx5au3M7a3dODN4ASna1XTfJr3XP+mhfVV/p2yyz9flu/CWlGXE8O0Mk6tUBe/i
0wHMuR1V17fB5OQL/TjJ8K/8TzyjVamfPhJC+bnMO3IvA1njCIAJv/GLzMM+T0vWcqzFsoLVTp0D
rpmt7atmmDhFhapD8HcE79QNWG1qc2vScYI+M2Re+2udvvob9g/Y4RSftuMMEXyukx0HWFNPyMe6
FgAj89yIKewn5iPywHIrsDIDCu4+gSaYhPx3j0eFFulF2APnbRmF0ENL+nT4lkYDKAVaM0gn+vMr
PSaVRIeioJdFmRN89EXC6EPkMWqx3hWf/RkLZRU20I7Ww1y1xGf2hqonzw8M0SkUeps9RseaN/2l
BPAuJXhN4Xjy+p7qEUfooaYvS6KLdBqCio/3QHWH0qDCUEGfabCap9RoZay3PEJa9OFCa8ZI1fHb
7ZiAy/+l/LVCpqMyXKrrCegZRI2rwQgaYB1F8ZmwieLGh+dOfiz5XMZ9v8y48fy9nuLrGho3vqEn
nbXowixKp9fjC1pOq+vVIsD7I8hC/vgpi5XQqavrWRYbh7dS9/XOmuabMAMbXjopYFyfvYB8jtdN
NdWEc4td3ghf93VTEnqHkMIELl30ZoBgyTc1Y9NgwyzbV+OygXM1EIJvC57R3YrX31fKjfbyorNk
/pIpOcROE27iauhJZlWsYaQeqeqlp9/euU87PDKNnsWo0+7t5sEOnsJWRr39V4yHG3bTDMn16HER
36+5GiLocPzchglyyBJe5knlaFntjpM3VdY3Hi6CZ72fWxoEvo5+LZmmBVPf90iWF+h+bq2R4DaS
MEMIBfG+Gcgi/ka1H84c8XOa2ZEX1EP4vgAYnqBJIaumwCmxri0fSOFCtDhgW/0Yj019p/LzLMSC
4x8cA5KAsauocN7O5olmmgGqqMOuh7kJdc/hSUMd2YBDNTNOkwkUDU2dyl4Ki8eIXMpVIyb0SjPa
6QRC78rmZR4JaNs+fpN8sqhyyz/z6pLgltd29gy98MnaXwz3ftWtigoWGyrO2/K9mZF/7Z8w1QRZ
Y5mMlH9yyqhb8vlztWA7hbHL1nUf2Qc9DfeWii4jYnLoQSknvM24N0jJl1OApBkbKIuOpHgjIpMv
nFLyE3qQNWw2bSGyPDuPKb98raiccR1VB1tgejWKJ1ilCq+N0w4cT2QLslpCe918rgaz8Jvh5GhE
bLDocF56R6RWH81x97LQbC3FWVvit/5NLiuNc6BhLJPkSN7VdSLcTF9IWoTZSEdLUHs9rRS/NyCe
rC6FuVe+vSwyxdM7cGJoCI2kL4TkP43ujBhmjriwr0NrKraXZmD4MnhRiQrvwgHUTflsm880UDlV
wkbIf042/WCRqhLu/eBGH1/z6++Nwq/VkekQLCf/L214EpD/ReC0Lcod/OO4yqbxuOafiSnVPnEy
tjyG/0FNrfJ79LsN9zF7jJTRQXnjwB+cxIt82rcSXpd+WTKtwYiO1cfl4UopH/6e4/KN1UsuvNXQ
+r6BWWcrcaOe8rF5ALk/Nupcfq2UWchVyDLYfKrOq/NSvxtcQ9msXlbZ3xDJfqqV97IczZzWuyWV
tpZP3w4lJcgwQ3g9g6AcwFm62EKiHlIOY/e3jkt4K4iFA+ejQWh56Zrh2/cYI1xrf5kD1rhq/ugz
eXdIu5rj1XeVKhwwmNyL669ZDauqfsAqp2bGCi0fatcfnEgJLsyHwbRbs/GpEzoCtQrpMtZPIuNp
7TkYaw/tQOVO++L0drTjWFTa5WdqDHUjR5/oObBGF+AB+RUI04+LiCB5+8PxrZD5khH9wxT53m6j
BZ4PVPY6NJB8D1QQ4Nvim/cxzcG4z8iqyQapx90F8WlJOnotebDy1jOyKX23c3n8uoYz0yMZUGku
ERUmiXOt+ohmPiR7iQezLKz8iCKV3stxlaL+VhGPuuyzCXkqAQrtCZp+WFZCISFjsMP7/dqXhuqg
qnuxWtngBdtC1/+2ZwePiCT5ZODiezXMS9k8sPX69nHl7Dtdhl37HKI27HbblSGbMMvBVHKrq7Cg
vStNQrIVeqI0jL3/4gQDZ4T1XFlw7A1tG7P9KEQFC4S2aA/mq5ixoA4iGlw/Jo62tAVn6TsGYhho
DqzU8XHO+rwZ1xNe7bSV6NqFPBs59xXC+SkjIQKjKc45CLiLlljhjmrDndJwQ5KLGgmtdRNYtMI/
oo1/KSfPgHw7x5I8HgexsKgb/jIy0brsaU3Q1m43N7QAYeDhtLphO8ingGgPWDOo11Uv0Y07sXzT
IfE6SbdP0VMIsuO0fc6XS6/24AhlbLvblIrLQO/BqGu8jkaicO5Euoi7Xp+xr6m1VaucC4h/5jYk
bU+1hzQ02B2EUELTObDnlChQodVeB/re6Zn2nxGmCjYs6ihPfc6ce7Frnjn7oxjod60/kXuX0b9V
C1/7JLw+fnmUPK+sDVXEPY2jzsbKjL3DilqB2b+EwvnzAAY/GDCNS1Tp8k/3zUCjUbcQxFjtPQv8
S+w9gItvxe+JND36bEfJiJBE+BgdK0wEVExZPleuRR8rDa6Scum4vCFUKOh/E5zGXUZaW2yoGb3F
ErSyzoXfyrJWthWV5b9QMFQkLkxKXaB4pb58rvoQb3enAViVG0S8Ii425sX4TZYMKDMkqwlPe3HS
pDS5OqoiXRLRxiLwujdXohmQ0JBOG92ztIoq8PBlIajzJb/gmZerpTb5yF8MooJxw5aH9JnyX0HV
s2QWPmlHnm33v5jtApyraPcQ0g4X13GebPVJH+QnEMn7cHve825QRfAH44n9QebijnrpOSF5fWP/
j3/wQIuO13An2HM5epcnqG+P87QwKrw/BsKoDxIRWK4rAFkFdTYtIVr3BQ3E6Y2PHFu+28iqLnek
orYUpie9Hq7KU4lVvjE0WJfDmR097veVf0/qQD1761eNYSaGgENwv4ElV5/MtGqrNfkHjUoyUZWd
H7BHhGTKEnZQOv4R5nn85mhDYeCIJLR6vKZTE8Yaeh/Qjp9mz2q8tsHWyOUqVeUNqP3QcZItYtek
Zzn/GHLcmhO6DfdKavKVWT/cLfzuKkYkYpdbHEf4L2WnlZHTFKR4LMUwblDRCiRx6UBbUPkjQopn
/n1yfsNSDY3aufNm4e3oOx1rBJiZ84VKRS0KfVp5MkMTRqN5or0F9jZTKP7ebYs50agzNaMvNF5c
YNOTBFc01VIlPy9GmAjfTie35HUnfbtVAjbahWpws4jjib70gAitqneKWY4hNeAoYf7qGENW3sZ6
jBkv93gYebhLkki92xPeaEn/TYFoJqLXkl8teC75Xy4MntK3mM9XqKj6Y2f4IQ+iQEBwlTfPa66l
XkmbdQyhyKTiQ0ESb64xQDlvA5UTPNV065iNyENEZ4dKE6odYWNb8U8iCyGucxzW4E+xqUWEtin7
ZVZtR7iY3DO//gZVquD3ZexG0OYntslJ/EA9ThADWjiVcbq//lVO3HYoqYRCAnGz9MeU4gmXRVQy
eKeGQTsvadGW8H8481qp748MrVUQxlvvY/GVBXFixyFNsp8xZJIdqd5osbEFAq5o4MC8d0JuD8L6
NLbOhKq6RrqZJR7UkAG0OwgV2LCl3iB/M3m4BgnB62fvY7MSDiAFP03W6GTfrw3z4DlgweGXtxLJ
J4qpkrLqAwOf0FgLvuajh88bwUJEyzuN4Gj3wwfsvTXXwZpFG8ghw09p1+na0qFQFYpbt+Zbyy6d
YFBO7Kp7pcIqdZQ1jroI1+VXj+fK3SnRP4vRs4afdbSDi9dlrwBETZNiHRZ7oJeWQ8H7gsfPro8i
4GDTxt+G+wjTTp1HsDQlW0FsMsybWRmi2p6Nh3dWbwLS5BJYBYOZ3HQvw9yMbpMHAdtmTYihamk6
AJzxc/gaS6Ja1ufWyRUhelJGtmfLOsbUseukY2YX6+tOUWYrEGETJ5ZyKPDtdv7/HXSiJSZFc8Lz
RJrhb1YhrQcYtYikR5Aa1NzfeYEsJoYIBINgy48kP9Y3wiPcP9yM9SgOWa5qxzchBobJFCEej3jl
D0R49OL5mY5bCuOGGPbLJUT9IWZ2qA4qKxj/CZGh24McGXobzX4dfH8iiik13qviXDtRDvQs7A18
Vbf8b7DSDE6JarmUrXUxEWHOl2yFA+cDHmfggTDmJcFof/Qu6BBsApVDXfff3QnOSRE8a4c8v2RU
Kua5hMypE8B1TArGo690ln52vBG6TpMZfAOUGrwj9qfgcq+Rmzitj7LTg378ozHlBrRqgYS80Yr9
yS1V9uWTPKnpctp2onHcRvxXYJLClM3/fD1zUtL6MiQvTTKLWy2Y+xQfro/M1HEaxLY1FPi7S0uV
2iErQWFJrBvT1EWSoRaa5w+D0OPfrJe7dRMuw+4qXTScSN7/encfCySlFIEfd/XKUgIfRe91FuRJ
i1CHeEV0bmQSDfrFu58UruJLcRpTgqxH4RAB7DxlAHRnIZr5suN16aFSDW72fgTiaBL5ksk4G6wz
wGDGLLgiG/z4NXGYzeIz8lt+aBw3RrwI5a7Q+n7K0nFFMhAgDNnBds0l1rtDkW/ayAWsiSHvVmZ1
71BxcQQEjGpkIzA89S6KlxXVrfE4Rfcjp5UBpOburcDSnWj2upuD/UakAt5v/a0GaZwENojHl1+o
hNwJsPSiKJ9rTCBREwvCu1siHIY+7Ht1EZfpQ9ipoq4YD83sj77cQs3YpFAp0ikw35aPLjKyTUQg
q8mlvc0xnRMxdhU7JQE0wn+FnM4Z8YTOxAx8kGleWeak5Jm5SF6jmhBHX5XNyBxZfuJCmzRzujmA
5AvZ9AP8L9xITT+qQ2opRYBTiCVcoCktUNaIoj+QNqic3jNSDWsYi1rwHJVyNtLo8ir6GfBf+saT
Py88GU6osyJwlU4Xo5OlKy+vpqdWT3jAIUWXYOOGUfbLUMZkepqe2Kyob2BnOWvuO2nhs7rm+TaR
lj4/5FaMy+iV7MthzZdIkXZxEl9ql7yj1hkTDkmBdSzfgSK0FKA0xlMomS+0nFI+g3/XVBpZbao0
YCyMQ0fdJYxGXAAGDAhz4fuyzKQFNnetU5Xbfw+U5LCpPTRcCG4ooYArLcy6LlOTkkIAyk1mlx2o
C8QhDhnnm00kARH1T0ZYQt+x+hXa2nHudubtdWCCgEna72qKFtqb8fp8rjAW8ngvtmgcLG0ZipeU
BmOjGy9dkrgWWy0m/9Iy/cUuJc6jsQBNKvU1PiDWflJdQSGyysk9jqPhdAdVIhUR000GJZHR941j
QkCD8tBdyEE1nRbe4spAxDWDHbnENCF74cAjb7se1kFn2JIYKqG8BW3/9EZePOcKxPLXhEt8ksbr
5Bef2bXXkLmJPbCe6ZFOByBK/o+Zq6hcOewi5j9no6y80FKrr1KFk5Lw3px9H5kbX8YLNQGAxm39
fAo4sSm4hqIZQvOGU+rF3C0P07xvFT02mkEhJRYV6zaJU24wstJBNU+7gMzxfZObREGMQOSGUU+T
LUqF9jwyy4oZCicmpnNR88v2dJsM4aw83xIShJBGcKFsUyWpSNR1SMjPgvq4WBiU6gKimoJAxUJK
pcmJj5GJuByEu3VTeoFXMqvkdkeo2RQIMEOyUxz56jFKrnjd/TQ+POmRXOXb55rhU1feNQE1FJ38
WF9c3Zv4HD4ERFhqN5Q0Sv1vuwgZI8AR0kevpzE8M4QXsmLfxrEh2arKdisbQBA4ZJP+2Z/1MUMz
PFEjLijYbSpJyOyfFVz5zBB3PxV93xtC30yjsK/U+V8EsYMnlaWSRtipvTSfAWFb2UWrZi1PA9O3
ZsrmdGF5DWef4SG9FQNx4laBBtld1FGV2UGUyJBzrX5zvk3Ip2HzFnVXJlVjLEMIMaTFcXfSgeXc
ttoVK5XOC6BhHN1EGk/fITPDQBxD9yeI/9lodJwrMirRDWKBl+ppgnznHUu/nBY9a+luN07jidkg
dzm7Xon34LkHVPPNvaGFCL/i/gh8vCpqGHCNvc6Nhov+BLyl7VJbvQ1/5FrbSFGBZmQbzX1eac+X
p3Spo+DYulvbKiu5GFfLDmWko6ogWtNn0fLKMZkogCIdw5hzMUklvDDQID5jhO89r9o30ZeXEnK7
XwHbvMrwi56iAgJqDrWPVdF8e/4Wn6r/P5W4FgBxHwDjXI9j6zZ1T3rW5xMtdYS6PSVNIZ1uccUN
tbufPM9QnX0awSYWxu/FOr+d+UxwHHUG1v72zQ6OE78mscG+97AzMkSyuvCszOvzMZZyJUh4P5Du
YElDaQYG5g/DN9FCkkWjNNwUGjjnm/F6XP3QhswEfKWE+eYFv3XSLf+yhv1Jd8UlelMFULltngYw
6zGUjk+dtwU8+TvljWQcILBr7yYj1aXMg7F4puPwWSjgBr2FIqx2jM8f3XSkO4R24w/Js02lJHI7
UyCWeBpDefqUPi1Fr2q/GltZEnf2rGUfA85KBFY7jyrrj6ssVTkejFOycol33DWO9mHCfWUYPnax
Xvw2ia2ElDGVr32cf/OAhyzknrHNC8w6d5T/wcJvHjCN0SXVgbG9OQxIDkQSdLkxSMmHKvkcUPby
XQhhj9eB01b609LFwOCPIm9bXChFcPgaq5pPPUECdYMFaTn3VWaQw+4YDikH+wRHsWc6EzIisK9Q
3beDDS1EUmCVpvi0AzLgQsczhQeDQMtQ5/D5hQTdaaQGABWnOOYwPOYVRRJAs/479vpM5be15Jpl
r2fAdts+IN/XuA61i5KF7gf1/06gyabgy3VTVSGbME9IS0lnmCGCMRaSlpoiXa+OxbIBb60Kqy95
i09OowUELqBu/EyMo0ciqTvrINOlguvwYWxjP4zgn7ywHNuYUCXsz9xF3+xtGIhnhPl3eBdpyS8b
JbL28ZEybbsLhY+GNmXkE2q3xL2Y0XAbN59N3usJKe3l4suAMtMptz6uMaE9ZV011yaTLBErYAtY
tCtHENcBnAfd0F+0A5HeH8J3nqwblesCfXbyUlmjhs9uaIbWXkzRTID09Awd3QLUY0w8HOCmuwMi
bXqNqldJVUzLXioFokCdUF15GUsN6QyonEuVHiLCZ33gQ6WbTXD57kixnvCunIslugRlNYSZEjlH
KDBFHyXsgiCarZI1Sq6W2yUeQ7mJdMp4AJ/Ilb80nyZuKxXuDM0qOtDUSSm615Ctz0tfCa7d53DL
Zj0orqM5F78ESLUE6d8AsWaFZlvsP3FG0dmvF7JQ3euORpwQVxurdd4NC1rA7LQhMxBD61kOaMM6
nyEi3ZiGzyqw0wPmHMAfBy0MAbVUV0TBamSfYCTCzWGhw4HW3ihnksrKEYuYOZAdH5/CpfQ1YGWo
2nXvCQTc5bKpIyiqw/0E96amX25uDXykYqcWqC927xBySe/20sGwF5UMkgyyA0L4y++G9pheq1oL
0asL5gaYIhNYkFkGpE9JMZEhgJRnC+py7iG/XqVV+vBQgoYjjhPbf1d05PLNGJRWt1sjETmrVwe2
BOboGryN3A2bCf25lLwO1qDOIr+b/OBv5405EPCAntxCxPWRwlUWFcL6M4eL4HofsonLS15UzGW+
ja8t28Mh1I787QceC2EWh/ZMPYCtktDu0wlM0jyirhJtcjBYdBI6V8TB4Y2454g3frg6SoKKW04i
1W0WB4ehaDgOxShUH+EPAEKA63pYuDc0DVOj/wOi5YB6oMelZtLwhEy1zA8evIgilO+r+FpNdiBf
lmzyiJZa1sJCYavVkR3HKdwsAZkzVFngKasdVApaRoninIsYkFu0+NQiEoZBT/2WgmUdXv1aA0KH
lwfi7tlIbcMMC882I9IpW8NMKO4Y+ymzP99YdVEkVjp4Wrd7VTlvlmRyzLQw7BdXVELmPiI58YJk
a7p4lTalOG2hb3EWDdJBlG2s9VaF9VS7Ja3ShNJvtt+9QRIxfxssUNcXYmiVM3x/AfupRt1CX1UY
rtdYZDp9p2+ZcuzSPgdwOr9pSLPcFSozytlFSrEX/i82JK8JO6qv8B8fnyIOEyVtNWMswfMCk0ae
CbBruizJ3m3yo4+c1Smk5M8ZtQhcMnXPq8+dsui0v59Hr+SFr3Q9y0rXTLD1UFA9BY+Xlbzgg3Kb
Z1LDM6JWQ9pkRkEhtsNLxSO2BfNafANax+29GgiVI3A/sKriaggEsXh5msGdO83yIHGaO0va1vG3
73ojIxZUuvvrN0wqjWySEelrkgUpocpQM2jMLJD88PGE07X20+2AqEAop0ccznuxeex7cD9RiRFn
33HCCX1TrYx+zTHFiq1vDGvBpwA3Y0MuPnxAyAFKHlY0FxxdC9/qrdL8yBEk+kCy+o00pDc7z6Lv
nzB4jU99N//HI388Em396dKOUyUpbQzKpQqVjuLVrUltS9Ljj8P1ZOSs7NOx1OQtxp/mC5VtIkOp
bQzK7PobvL6omylQCa+8wVpuzR0oe2MUk0EczgZJIZp3ZeFU84jtMUehE/uZXyhBD5cjGk9qJZsG
C42CU5CSlBkWsgkPcBUikPtHzS3/BxuB7kLDJJ2eBvUHjQYOK5GGO9/5LZu79cNjAk8QU29WKcw2
JGGVRQ+ZBfHFT4TbFtJNVeBwlg5uUVBhHLFHVPQ+RdYeqx2GC7sxOGJTmtvOsQsscxSNXLArkMxa
gsoNUjylgG/MFhRnm8shK52zzIfrLIQ7ItW8YLMKXZl2OL0R2LtAPC4ergqNwa5hq/kabHp6KoS6
ROpvxPkM9gqkTpGbeDD3Tx4bVN6sAYFELFGbXh8WDsaDLuJJ9KzRQTz5xjlq27Hms0HegdgJKM7u
mVx8KVkEQty3rDrLPrfbfMNim0D7pKLkkkLlRNKOPPAg1Dn2Nka4fX3z5gbAX3dnfUXXYvsydfnK
++gwW3FqHtU2nmLOSMVsGRZLnYQCC/iPDRQaZKA2z9Dbx1ASXEh46M503bMAZ02Zib7cIS30lCFc
oAncZB9oGy4Gn7vmyVhtfzrq646nzPxJ83Bi8JX+pf+38FneK0lQzMfc/n2wEbPSN+gTpy7Ha0ke
8MM6oxwXx5dx7DpbYySFrFbzwJriQqZKrv7+D7E1pOmcefxdEiEbhg3lwu032lQ+XA3b40FONaOD
qeSGhbgJw8swQCuFVEODAjN9swMtevNOWuP2qQzX1vucHxa4gN9qQQfxhu012z+zav92/REh5odF
ruOeQvmsfhaXB4gcscLiuaWkObIQN9B4+AFWCPj9cxlPzlNczAz5/5H7Cmh+yQ26R5CmIMTnAfkn
00/6WikS+uaXif1EnejnBQncOc/um8/jWHqr76Wfp+ig2b5e6KT1M0iotDza7ND2TwLU++c7oT47
EEQHZSW+g9iZay8ZBw2yzRkw6CBxLqcx0is4wCFrByKUry3VGw2VotVCe9FfI11yQfxtmk0Dofdq
J64iLU5HX6tYkwpy6m/wcCfMqVOkzrmgJaJY02bWpSGxQfPaONoMQ/+IBF/VKzokJIUdYIm6JX8Y
5W3ph+CG0oXszUU6z53/L1nfDIPAZzMV/BrHv3ZzeM6QFjlhKJbGTj8G2D5YjS8wQHG2JfOSKd5Q
GTuzQtNtF82ULXMbzD/YIIjrFjMv/SNWPIZhQNNRjJ/le30QB93xP5/UOfC/tejZAtj7+iMpwXtK
tmTL0ITUl/eWXSJvTbFPATSlRBRJyAaSkNl67NZS9Qha5bzV3zEwTnxhZ6ljS2CvAy+J5HbiFd3p
u26p8HGKMqFfUPSBbwVXgjQOjCILBvFhac9qj6Y8rkFKwFuoQtGtjWNufqSKI/F5l/Y+HddcYyxM
810sTarNtytlakDQp5lFZKVpXGkS47PyGsueVTsssaNwYYYZ0Q==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
