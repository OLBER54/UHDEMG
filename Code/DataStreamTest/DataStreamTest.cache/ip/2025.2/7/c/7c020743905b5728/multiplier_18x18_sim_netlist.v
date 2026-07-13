// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Jun 15 15:19:21 2026
// Host        : LAPTOP-H85DCTKA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ multiplier_18x18_sim_netlist.v
// Design      : multiplier_18x18
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "multiplier_18x18,mult_gen_v12_0_24,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_24,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_24 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5744)
`pragma protect data_block
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
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
ZoYv1KN9BJINkUuwxEORVUZUmrl0kJ31Dn3xsqXtAk2x8TmLbvM4mT4BO5IrAba6CD5fEyvhoRG1
F47xfwB5I+N9Q8oTwHRGEoN0ylJsrosBnOYAkecNJ2N5/0DW3TTa4mx2fjrINbC1BTEibZnp97Ze
WHC1cUvRSv7tZj61rIKjzYSpYnIDHsCCoyKjqsgWBkSA6vngbUZ2kGLHNvtnaHZIyXE+c5GnsuQI
zAQXZt01oriPGkYixTgP5i/wfJv5wH28xq4MrcJLOXDAePC6YiX+e8yKrp2iKk7hBUcdvB3lFbaS
pDSCoww6V9zvZVpMB1enT8RMgphm7z1QQwOCfRK8DqUjiUZgjfyl2RltVDe+wy9/r/iiKV/MQTzB
6gWh/HdP+YyL8GiDmTEPx1xnmynzPILPdB7X7MVzfw6WgKhOaVAGInNGelca6WAratlpC5TvnCDV
MVAyr9vzP7BtIila+yQdknO8BWJnGIbS0Ug5enEzYN6H++LhpKLQznFYO4jg9VW1QF6pkjVt1LPD
fJsjn/XcQHMKedxn6XyvfEsyx7VNn2jiRPIjAW8GKnkbWx0JRX2UBcdUaDBVPGZLDLuDf/Dd75EY
7suKlhykpJK/R4BDdoSSYHGxIOabugVnkMs6pbTlGSyJQNZqTncWNAXUd1FMSJ3hcwZXe3jmKKsH
uhHSCVmYLkb3wpRzlfAHiYAXqr0OtfwojENblTYiEgpHmZD9xctkCZuQ8PElNyov4nrPIiBzTru+
Be3jmN8vLOqGKo03uM0aq9lH/duHyjX8m0dv0XkLTUsLTbTKPRLG2Jic/5vmq12sEyUKS0QB8uoT
6reFilru59+VkD69UmP7y9ci0fltGeILmXG5ebNFKfcmnk/7F8G7lR4aUfIn1Mil943dXtFJpCmt
lv/A8/lGVMqgWN2WKZg5+HOgiI0xAnlT5Hexuol3UtNp58XlrOc4WP+Cx3U1FsZiCF2y02whJMNn
xdzKa3xm0EF5oEgJDJeHsDLnTmcmDNslOXAuvOPA9oT5vyjzIKPl7RgRZcWC8zA+ipdSvM/fM760
GtgwSq4Yegv0aPN3oxOCq1DiLDS+Y1UPJ4b4ad8btR+H4xxK0wO+GfVpiMPRJAAKL2Oh2HLfVSDF
n5njuE5mcj+NKnRegczXbSQePbso7fNv63n6mkAvDiJz9XemFXx06/7L87aHHXVvsd1Ey09WAPnJ
fm9XDXdv5INx9kRj/Mx/AxpWnK52NP4NbAJPaym4TrWyDV7c1Z+luZD/0qp07FLibQS5y8Gwynts
QxD5VvVO7EVajakbkeNIE60v0W4+0LbHXHX+geDLLUtIcmAQ//0vehqD5kYnTwdY5kpgH47DBnyD
FFLgMgZjjWX6CUv2S7IRazcQVZAjebL7e6w1MXDcrgTXRAE+gtqfLH3B/a2rapEed4HEDELvFOFF
J74m4c7J1bJCAYtVFo/Ar8l2obdP/kyiO1NvN1U3moJUH5biIB47pUtLR5xU6jX9xcEbpI6bBUOB
X5yxmkR1uMdN3NOxbwJKtsy2f1AJaOsShcHdCJS9qPvEELSnZOvT81wjuO04nbshuJLEUoZRvQvC
86hMTsrKfS2yCqulXFZeXcFTzGYFTbTbape6fD4ESkV8+0qCKrAyjnzhU4UJv5afkOmOHEdzhnou
N/LMZwh4Z1jy3tq/ftLaIfo/qBTflvPA/TGqTr7tv2MyOQfQMsO+nYNPQ27KQoU+YthOH8qX2I6Z
gp/iwusDZjGUOpoOXzOHiHvqtsPeMmh8lnzw539zvLO6uLn7ZSlXwHvjOco/X0zwG7FAnGZl/Flm
ILCj59pL6UmutRqZFfU/vscTf99JqsdKK1/6o3jYvfxSAcWi8HOszPNlXjXTri6SoxQqs7Mk+0DR
fruZROb4IFMLfiRrEZQhXSd0NCcOOunwrV8Q7yI57k+6F4nTt7m2BUy2F1Vygvl3wE9r1xm3yuVs
vOoJSKcflDXG9FM2GMVqBbwW6bRqfmob7p/h8CcxivTeNk6ziwZVzhQPIUVu84yHtCWOtdV/W2Us
oQe8M4XIY9am4nYlqCJJ6Ve9DRJzNOhzyXnt3uJEJm0tXouIxqRKyQCk2XQTN2MyaD9uPxaJMeYQ
/a7gJrrb+A02ibA7FV/PtRnXoOjHxldSS6Kft7dQ2BfNMzyfhy0xRonotIm8q8HzWGXVlw4B3+5U
GzVDUoORPUWJmUqyQIEEVafiFgUh+Jg/OUX4PDAHXxPqeOkvXnW81Ww/N/TFbmozuxr874scj/S4
YMmePqHMLJLL90q6IVeGJ7hi+Xdu+r1mMZBUag84EBVPbUZ/u3qw/NQT7LkS4QLBRsuR8wHe7jGS
1eQJditNt+v3E6tDMEBZtncFvz2XIuVIC9nP5iyEIT1PUdiaRo9+BCFShEGFrCFKvW0FLXmazIsn
CMozgIgpeHeaZk83Jr3Ut7ksxA9woCAsOhOP9FTmjoflNlBACpid/ZiZX1jBszKSgHzcPVdLn/ZF
EDj/saGgBMSx1XsxXYsS5H1V3wbbXYT6OaMvvi0APutTpovxMBcT7zxH4RBJ4G02gBOF0XH4W5My
/OfGkQm1fQYZoQfxkSi9Lt6opdXVx44QaSVrBGk0hxZC6gQ/ITuP/ylAd9FxVIHuqJjzLEbRdqLj
QK+FmD4TDqo3HLRr/MXQkOfA0nmSS95UjepcmjndWS0ZMgP3s/NX6Ib/Ps2ZJ6Kq3lzNM1wC8tSK
RYQo+g7x3XmAjh+p3c/qaBS9/RUMbhsy5mrKmKuY80QBvp+6OtQBwZdye9PWbs3DWXDzSOQfAJJ6
YAfbRvsEOxhD3LYLGGMlAn4eZZDxhjf60vqHAhDPGehCqVRUCyNpwAKZAVmvJ1IW/9P4ThZyr47M
/UE3AB06DdYDKeo/n6nYrYrM2uWIU+dlTMbQg4ZN/VBLGWl/iid169FoWm1sRxAf5HXpfGbBDKKm
zengBTUBPJGZqJNBtagshDJ3BDY3IHSOSZy/z9iLMmh+e59x2BCDayey/k4/mrNrFsGRVPCK3dlx
OmrSFvSq7eXqFBi5ytZjm2ReGZ0pVxTknDVqNVSBEETeQoY3/RFL/gJwleSrkh7rd7uIDY1Kj7fw
lCktunUnxjfgZmNDOmNwltuLYYzy6eYMHBwz7QQHYA/vkW8uyo6QL3BI3ESl88o5IB4yTxotwnrr
LKQloC9KE0PoIYYdmPc4adbGQ1EkULEw5Yxlnz8WDYfdHUmhTRuf3dZ6W6sLMF823CtU7fnVUNv1
gVFGiivKIZ5fO+gcQGqBvaE+DEpjv67C0QsIhukYNSPR9V8KhDTrxQk9xCSzV0HvE4TIo/zNV3Jw
63MThmf99VweCoNmlwq9w/SSrAB9893OGXlfj3ToTssERmShoLaeDR6jgKIIaRyZuCnBZRYDDSSn
a565ZIS1qQA+AIPzIUjn2hqkqnjl8dv2tDYiP/OOaIJ4LzkpjQ/YZsiRe6NjyqX9n2YfU9HToA/z
1M4m4oNxVt/ZWqUCNg+FbbCxLcPHqpaqyuK5koe6g9A/nz/2SInpbiuw+I4spjsWgNb+rkDB8nQf
uv/cyLHc/4Yl9PO05OtxkvMJGBvLDsIt0eLBwKYfH8IqNn3WGpWbMG/iqItfxiaeA7ShQStVth8J
y1UeuXuhMNH7Ltb6ff2n8zWoBoaBPERmcDdUzUYluKZ85laJXRdISWrhtxY61q/NGvCa3Yx3t1is
v2cPYXjARdbzNjmwP6o2YSqV3H5weFjY2ZCjIwKYCPNQfw54dXS1pZeyXsFs0ub6a/sDp3BTH/Yr
VQb5sZxC1O5JCsHty1dJj6UV0pAl7qMlzghotrYbSnGBEc7ARL9dUTZ53PJlOB+72wPjyWCIyapx
hcnQSiV/VQfmCzKW2H3GiPLLaMsfZNFkfFOntjQRxe/6J1OIhVRsSa2QR0mzRj/AJeki5IKzgxOL
APWi6Gou9O62YAeiJt6MnHvqfoslkGB2nOJ1GLw5UfCRSZeRgHqrYCwhLMXdaAnKbUNWIKADN7tG
638bKhkowAodVnUvZ7jb6t0FvDAqE/SGYMX5d/AZ4X4dkq/YweVs18TbYaptxUgwAO1CdcK4Fo7f
rofdp9+DpIgdBoRp4wBjuksj6zZ3CYlQpXHAgpSAnP0n1SOy5dg3zsbXVhnFjoUJaVKIDl+pjEOx
e57+M+1fUUD3CgjswHcPlD0fTvwHnVInichNO/GuPBsWOt6Bc1t7nqv4cd6VZq/Mcwpx758Elmm+
GiGHkszeu3eYk0KJqsLaVZABEO39Cz5264e+ttLjAb339T2UlnQSrRErHkdorwv7Vbp29QMxnfh+
UtOZMt41fEQLkJ3kMpR7JdK7KLCLe5Jd+hgx70DA3kEIyR47nas1oBs70NljIbm6kbZGlAHxoFc0
MRR8AHSGYdQmuprTVWmg/mELwRA+gfvrpE2No4j95KSvVUBAqQ6v4+mFB2/QCJDaJakyLelG6riv
28OK/eqyE7ZcP1bIkjNldvmpRHV6YIIIqcgILjhtWX+tnKIW3bDkciTAm5VEGvv9Z0IRYQS6r+Kz
McnYc9Q157NqOxAlF1L8iCtd98UDJt/MwSSZ4k84pQGlHHniPGARssZTBXdTuV76FciDZXkrZlgK
gHEEOc+RMSeSI/iHt/XFa3E2Npe6I3CRVBDPmlpPKm3wooPlOkvxKc3zg5hvo5W2bax1I+IyuO/3
39VzlyWhLq7geCpU016okZp6TaypgyZlC2GjDWtEBfju6jew7+yt5tLaQpWgJI4mgDBRNN2R8wsP
yRHHoA79HzM0bzc5BibEPBzHE9UgVXa1xcYpRpISbcUBmSpZ472pnHD8WsPGubHakLrQSJ+kH7Jq
FEWInwUdqOPrjLPxNShg7882XmBpWT+Wn7XxART+++/wuw+w0SHp3mhgDtN7c1ssbXpew5AQtr29
db/InWpgT9yyTqK170A3fBM0mn4e0lKdCwGXPQfBNI7RhuvPFk+CagzRWNA/FNQizDu1+vomn6GE
rPWrjDLksyD3sW9yYScRh1wGIWdDdcwULMoo+cUsaMNTVOktdpFVyaR+BYUb7t9xxgEFiEUlJExI
8S87LU+H7zon21E6ZsQuSQsLNytCXhTgZ1x3nAwoELz6XQNvuwtguVxX37RncRjINmiqpYGdoV+r
gdoygC+oY4+gDIq5mC3DGyeN0pkEdUSvBSuDq9J+a5AuOMwl6jLC4CRRqJkzvg6PzvXj0QvWupjA
QoAp/CWOwEoiS54aOcNvxkPdXZ7FtttCXpaYDEpBNPD0usn3qQBhq4jxtzQdOKDnsihCCIfZ2tDx
jnJmip7pcUE6uHmr5rLGO0bssNLE0eGSqMjhM4Bl6pZjGHZ12aNwKNDfYBkX0lZV08PRqLUAQ5zh
HonA8hmdRYnvU3J66JwFxajC/6T9tcgRnAiUl70azgF8/EdSaeubZa1W91LTobWsCICZleY2XYSX
WvXSu0G+471KZM1UbvslvRDUI9d4MfPej7Uliyg371R5vfsdhwFW2jZUAsFpVx8IdP/nq2JjLqum
xswdNvWe2+SndR3E1BAe+FBYNoQ5VQUxAGEqP1BjHcvlM9kXBG0iqUlUOY3HZg0jsBqmepRcDMjq
nz9wA+aP5mlVTL4CX0yHZnpzrKfq/7SwM28I3Vb+Lx8hOETGloHQEvhEqY1KibaOISRq+KOOTayM
26f9tThmPfwmieA5KpR8lcxU/adlMkcXwxzpM2Yz5GC6FqAB6IcgQMNhk8ZoWT52R7dfMfDnrAz4
avI+RqJzHuZ0qrzt8KmN3dj0ZkY8tMgY4x0XWvaNCuJz9qJRIrRMZklMBFlCp45pidZJGn7SEt1U
WgpgaxOYwGW/G/qm4mRYWJHnp6FAvMIdbYTVUDeDkfPXxbBdXwpRG4ZRyBFxjZZMBX9+VzNHlXA7
C5QdIETzVzki+pmObPAXpS8bEX6BXpYDUxTIaAQ5nT4ZF4DyIgTtsU1pCc84Ob3aaHHtY2XsBXsn
lClCNnekVaEZWdzgtajrEYJxrbxj1VTsaLUNZyz9MYBAkThb4Qc2w8j4JvUmDJ+TRpZA4nBFg6ZZ
52sv/lf3cjxu8Gt1g4IPkMEhwU80ifmeSHZj8t8YJpun3gvu6uHChiKiFPc8dHNDpChQQ17nFnAA
rtquMzVZ2tBxTuiqwtJ25GIxreCURlvtDScsqubYpomgguAebHh45m4ETifgyaERtjTaYj2BZuVv
kVyEftnIpLIukxiR7e1ne6pACU5ykWTH09zFq+uLZ1atzxCl/aSYkGq6//rQs3Gr64lLVU3luMFR
VYwWMHNngYRIn/A595ccUAuMSyYQjrQZdOAEbpsIQ2saI3xu84l0nHkCivZPpkGy/HVPI6Ki0LVf
P0jcGXenVr74ms/GrLRaf7RYidhgRTK0XcAKxLJqbg43GCAEknXCobWjcElVDMswFMBfnQQfbME1
TIJ9931/F71Z4msFS0Nn03f1FC79nBHXW2dlKAFKCcPcWyp8koC9Ku9ArO59O/4IW5niIyOmDDwJ
XDK81h6BLSfgW2AK71f41QP2UgZj9x4w+D1OfxwUzEYwXz+bPHN54NO2mBv7OjYL9loO/IDmWnsy
MK6mFxwZF37m8MNuYZsBkNCe44rTD+iBCg4IAl3OV8+TinAol4ZMILnhYGCripEhNqSwvTTX33da
q0tbRdOvR5JGH9jc6i5YAMAtLVqL1Z7KdvlBRKx3Ly5tGCozPzVcMTFQ9r2IfSIEdZofmeZ+Vtr8
5HWe4E6QxYwElqxQZHE8bi9Y7rV+wUIaGdbpZqSDwjpLtpt3B6giVppH06qcaEVloYdAxNSvUJhv
qA4BfrzqapkbjpKUKTPYd3FcBJcevs1zpo2eibCKaTWzQ60cL41GQrge4F5pMQ7iLJGBcNGMVAVu
KS5ACzL5S5ORTD4j6dTE+WB4rG48amPGiAil+8JjwXWJBmwDMKYuPnXSZpuuJHruMD3gH8BvXZJQ
Bk7d8PU3JwVbRjd2doXZRxRfhhOmapXDnVC7aVz7Z6JDLQeVYMYR+8zMIAK3YQaHvUqjIKg5diEf
9SdJsusf1H2Lf5CBwo6qGGAoiSNzhTqbOENf0/5nIYHOnfSowzo5F4gj8zXFCoFoeDf2UyzhZB7F
QRp4Dya5u5WypAnCMl4jsd2R0/ZgzzByot13u2Ie157KGbdG0ooTvWOVWWmJg/YIlMJAzFPmdE8E
8EX2NKNFsVC/SX6uz2wMW91UQ742639Adbu3O/C8AAr/5iJRCwdche8oXxmP9q6u4R8Uf/D/qxTH
Opz4KHcZnR/OXv2ewjH2tM3rkJUZtMHgXJqEIkIDnV2RCEDhMG/s8MEWJHyaJUQwWuDJpI0Dg2pW
i+w028DPZ6xP4WLLPHg0oyAwTeSdRWS6a+CNDIUTjrUGXrFNW6q85RvaDICBfKWz6unqur027JcW
OZs+Wk/abYNSEAdgVds4MYl9kgXK/th0qPxY+ypoH9F3yG6BwH91Iew4kxoXiHgthg6SwQFP7H6S
fHtdBOfJnyzfWNrpkzHmnizHRvwptMQiB/8euCVJ4zw7F6zzIpU8fB3l0iGs/bqzDTdtrJKCGJHL
EowlkuiMWmFtxWfiz0QoR7RDwXVY+X1nABm92aU7kcYpk4mpw8PVLwgqPC7zwktVdDoDLeDvKMvd
ZRaBqItbIEH74orCBlgmgAg/LCQQXpgJl5FrAks0+oR/gq3WSIjG9LkMjvHQ6MrVGfFq2XYYLNpd
Q18TzG5Li54OVxezY698cNQucqslzQ+SYf+nIzD4IfyvuMed5ibyI+ouGlVsTKpfnV8lv09h6L9a
FaZIcsJw7WbTGKejFxcbY/edVu7Gf+vCmyUSFD4ZLW+2ErBGbniQZ/YbcCTKPOpRPdoTJiu86ZIg
f4bc77OZOyqcsGiZuAZivrJ7koidVLEiPpN/qC615Zlul7RztDu4o5vEh918GVcA3q3oVUU6ReYg
I/ga19FBSgTlvYdtUr4HrpTG/5lKJmO2YX8fmBnM8bam4VYg3BBHh1GtN8OPHgS1CvGeXamazSVw
a+gIpELtV87pxTiZkWY73G+jlSY3wAPQmcGKxyJul6uMsBh1cCKZNCxgVHf+6SRmli9gf5ayvJOy
2eFEqWflnPmaCOs7S+NsHi/Fev5GtFQysJ9mcDyvbH6+mbbCLWepx/OmXVvV9E9bKLZihd2MH04l
x32xEr9XC1oVfTJTRzZy/Xlib3tZhNIRnsPsI5bMb9uD1L7hdUX55JNaIMH4U4qNRChcf5Jhcslj
jZg9zkt+3iHblC+GbwNb3cjV4pVdflb1K/G/i+TO4zDcFEeRjGPzAG6O2NuCrHc00YA2Ijeh7F3L
23y4uhhKPnLG+iZIRIqJfLcihKYyfr43WwE9PhraOrm9QUIsxwAyqSX06JTEQVruIdLE6OOGg4mH
I76YfAGbxJufAc7rEryVi1AeFPxJTEi2BmObAJAz8Om5KrcltK67IT7uRK50UDTHdXIN8nQ4glJH
uStwZoFlilnumFmpOJyIHknDKB3jMF65ClThLk6yHeQz/TgpyMJ5Zcb7m7TMZ6hSMg4YstPDKKoF
CV56E648k+SV5FcbXff0feTR240cStZfitqOPPYxTjtiJznLzLnwcYLZi4wNkuAzkW6sB896FUlJ
CRGVuZvIekEoytr5ic4jbXGP3QKl0WlGhjjs6j7CVe/uIuxRiUSq8BaB4HmdwhHqnInQsGGCL6uT
1FvC9fzTduhWjOrOLJZzbPTM6cXhv/NnH5YVLoT8QP+ufFxizqTz8YglJq29GMMPJWDYFDEYH/bW
vEwCZs7z4n4xfMyhrOv2qWD4tr4y3waN5BZbvGK/445ulh0KxuHRHDoIx9tqIR/0g2fwMFhg4vhF
XVLu4xswpDqi6VedofMkUgFb6FrReKQzFe/HXQklsaiWcSBKJEqpW0Uuqqob78T1C0BDAgZSZ97d
dZ4y4oRLCe1+tQhN6n41ZjlJmZqP7JZd0lWJ+wCbl8wpAdF35MyOBg60JhoLNesq3Dj/XXlkO34w
Pl4D3/87mE7xNCSMsCyiwcdakSevSEa7JDjTfT7G7WLPDDEKs6k5DjxVDTAh+dpeNM6lSdR0WFWO
+LevmhC/SOnjt9XIkPdOwlNP2ZjG/elpGWZJtL0R/BdOzJL9z0WK1baFQ71goM+ZJAz3OjWPCy3O
N3sEYNHgyj1SW4NaNmOGfWBY0AgpmrnFgKNu8dA9LJIweYQyNzhEMGpo66umFF32s1YtjKleB1nc
hCVZaaI7DSqYCUCNzZojUGiROJHY6VJcoaiSNCdfjfMhwxQUV5oTAfeb7d/YRTsBVT5HrEhvUVJf
nxXvGohoV2sfwNFhbPbh45SxkEtv4I495pzSLpxJLa8plIajaxAuacHt1Bw+dOG5yneW7J2dxLJ7
tgdfl3Ld7Tpz4rUNLa24hvLw28BpcdtxafQIVNaXON+JpmZsxH+56BhRDuccl/z3BAK/VYGy//Hd
RHQAgiZ5h/Sj90gNX6rSqDjtR2MKkkPVtuwkGk/PyI2eMBxvFXb4xDxCYwYk4oJqfO0189/DkXT5
Gp2DOsfhYxkGZM5Bfsavvf6btLSShroI2sqd+nQ2PLMgEyoOmX38M28Mm5qFZ5t8ymPun0sVezph
ox4qHuD7DE9wbtGe7aXE352awAmoUHf4RAeHnJCT+GqkHK9B+M2v4t2ae1eT/p0sGh4OyamcdMC1
cbn+TmAo5rrDWb0JE8iiZpSje/sgAWZ08M9CqiONJwLn0SQeQzCujbLmegQLNo026OWM152r/yOZ
hRm0ejgpr0ewOH8dDijzpqny54yY3YpMJv2BGIr4OHBswDyVabaasJQVlEbkehfGPKrChZ9mJrO4
w8cUtJMoW8HrwQmkUDiG7qA2ZKqg8+DPxhzxEan1u1o/QucccbHwIOXdM1g00edr+eNijWX2SVmm
wgV4JnJgjHmRfXrRieZYkFZE90PHrTJbaAYp80xJ2PvnD0EjMZ1GO/BVAs+7OZl1rpwmMuEF8VXz
3jChcIF19+11Emq6BpY5qKHPP6hGVFAENxYVHce3bNfV4mox+umu2RFbPZ2GOqYnF3VDoApEzMu/
mwpRpnATgmleeuDOYyfvZT5oand+RnH2q8TxqWJb0k1fw4hcrLpGQfh5l39KJufBkKT5oxQeyJRM
G1wOX06ias59F2fBcg+352HweovUbSGu0XEDjSNo7/BufMFm0vclmxEcc5DYHehoZEbrpsP0hPvE
HkXNahWhKukfmXun0aSPmHkSF1Ix20fk1Wsv4IQip1N+F5vkjT2/rPxcd9txDhcMRubwePNTRVFk
F/aWAWNVgT77pqBTEHQ6QI4960wHplAXxKqnft0Lu3bxEy7ZhvW4DsLN7+Y/2RxlqCtJvnMtxvl3
RWuXFlgXQzETy5Gqpn6EZUEMu5Ic5SCr2nxhvPZzQKvTtjZXtmjp51jXC3vEnLsZbkm0w//IOL/+
3MseG9W7PUDqIP0VL2duQQscmImfbe2ofhO7b2iLA636hgJwqKtzFtZLVeg98xaeQanTOgYDb7Zv
VTKsWo3muuqB0BuALHH3ycsKtWHnHdjfm3ormkjh/XJdhY8y0xX6yajhorbP3jGW/LaL8LMzxvVm
kIjEFfPmN54xUBPO8EFlQoVpFrM48IyEImNlsLYRGgcPp3NFuarNQnvqowAOfUe9fJsxI3/LoDoF
2/K9aRglAyPExB1RUXk9vOhjHXmX+iOQa+2OScs7hQ1kroZ2hR/DtfdAtSKoLQrf4HoSSCRGfDGA
V+kcpbMgoxCDKT1Rdv5dSk3P6jS7JO0CHTDAc4BV5Es5thd3X96cL0vc92aN3eGKNRwJVkHt5sd3
pWo6OTMTJV4tMQxTvQ9HrGzqzJc95Q2sDNuwxkssrcRfjxe51BOs2PI1pA7K9FIsx2nzhK0HOidL
zuV+pSeicE5BhDBzl9WxJybohsXpIHkVuZspNkb7jhKQLyVbEGkQbxUVjUlkimZvqnNG6QV0OXvP
7zUhk/ZuKpPv5BC02+7HHv6zL6b5eij7YNDjIdavAzeCwnDM0hPknM2zyTQXcwB/h0AZXug6ykjl
0ieq4tdnPu6pn/Ubd+XM+4Qr1Qp3UGM3DxyBfqQkOT1Fp3XDJYcnnhW1s0Hc1M4QfyvBND05yiC2
rxksi1knzI/ec3iJkHx5FZlpXKBGqjwkcYyDQJZc+5VkKWYW+w==
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
