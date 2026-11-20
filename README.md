# 4-DOF Robotic Arm — Forward Kinematics

Course project for **Linear Algebra and Vector Geometry** modeling the forward kinematics of a **4-Degree-of-Freedom (4-DOF)** articulated robotic arm using homogeneous transformation matrices, the **Denavit–Hartenberg (D–H)** convention, and **MATLAB**[cite: 1].

## Overview

In robot kinematics, forward kinematics computes the position and orientation of the end-effector given known joint parameters and joint angles[cite: 1]. Using the D–H representation, each joint frame is linked via a $4 \times 4$ transformation matrix $T_i$, and the overall end-effector transformation is obtained by chaining matrix multiplications[cite: 1]:

$$T_t = T_1 T_2 T_3 T_4$$

The end-effector Cartesian position $(P_x, P_y, P_z)$ is read directly from the first three entries of the fourth column of $T_t$[cite: 1].

## Denavit–Hartenberg (D–H) Parameters

| Joint $i$ | Joint Type | $\alpha_i$ | $a_i$ | $d_i$ | $\theta_i$ |
| :---: | :--- | :---: | :---: | :---: | :---: |
| 1 | Base[cite: 1] | $0^\circ$[cite: 1] | $0$[cite: 1] | $0$[cite: 1] | $\theta_1$[cite: 1] |
| 2 | Shoulder[cite: 1] | $90^\circ$[cite: 1] | $0$[cite: 1] | $0$[cite: 1] | $\theta_2$[cite: 1] |
| 3 | Elbow[cite: 1] | $0^\circ$[cite: 1] | $8$[cite: 1] | $0$[cite: 1] | $\theta_3$[cite: 1] |
| 4 | Wrist[cite: 1] | $0^\circ$[cite: 1] | $8$[cite: 1] | $16$[cite: 1] | $\theta_4$[cite: 1] |

## Hardware Prototype

![4-DOF Robotic Arm Prototype](assets/prototype_arm.jpg)[cite: 1]

## Repository Structure

```text
4dof-robotic-arm-kinematics/
├── README.md                  # Project summary, D-H table, and usage guide
├── docs/
│   └── 4 DOF.docx             # Original course report and analytical derivation[cite: 1]
├── matlab/
│   └── forward_kinematics.m   # MATLAB script computing T1..T4, Tt, and (Px, Py, Pz)[cite: 1]
└── assets/
    └── prototype_arm.jpg      # Physical 4-DOF arm prototype[cite: 1]
```

## Usage

1. Open `matlab/forward_kinematics.m` in MATLAB[cite: 1].
2. Run the script and enter four joint angles in degrees when prompted, for example:
   ```matlab
   [0, 45, -30, 0]
   ```
3. Inspect the resulting homogeneous transformation matrix `Tt` and end-effector coordinates `(Px, Py, Pz)` in the Command Window[cite: 1].

## Authors

* Omar Shams El-santawi[cite: 1]
* Moaaz El-Said[cite: 1]
* Abanoub Selim[cite: 1]