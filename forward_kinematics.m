% Forward Kinematics for a 4-DOF Articulated Robotic Arm
% Method: Standard Denavit-Hartenberg (D-H) Convention

clear; clc;

% D-H parameters from project specification:
% Joint i: [alpha_i (deg), a_i, d_i]
dh_params = [
    0,   0,  0;   % Joint 1: Base
    90,  0,  0;   % Joint 2: Shoulder
    0,   8,  0;   % Joint 3: Elbow
    0,   8,  16   % Joint 4: Wrist
];

% Prompt user for 4 joint angles in degrees: [theta1, theta2, theta3, theta4]
theta_deg = input('Enter the 4 joint angles in degrees as [th1, th2, th3, th4]: ');

if ~isnumeric(theta_deg) || numel(theta_deg) ~= 4
    error('Please provide exactly four numeric joint angles, e.g., [0, 45, -30, 0].');
end

% Build individual 4x4 homogeneous transformation matrices T_i
T = cell(1, 4);
for i = 1:4
    alpha = dh_params(i, 1);
    a     = dh_params(i, 2);
    d     = dh_params(i, 3);
    th    = theta_deg(i);

    ca = cosd(alpha);
    sa = sind(alpha);
    ct = cosd(th);
    st = sind(th);

    T{i} = [
        ct, -st * ca,  st * sa, a * ct;
        st,  ct * ca, -ct * sa, a * st;
         0,       sa,       ca,      d;
         0,        0,        0,      1
    ];
end

T1 = T{1};
T2 = T{2};
T3 = T{3};
T4 = T{4};

% Total transformation matrix from base to end-effector
Tt = T1 * T2 * T3 * T4;

% End-effector position vector
Px = Tt(1, 4);
Py = Tt(2, 4);
Pz = Tt(3, 4);

fprintf('\nTotal Transformation Matrix (Tt = T1 * T2 * T3 * T4):\n');
disp(Tt);
fprintf('End-Effector Position: Px = %.4f, Py = %.4f, Pz = %.4f\n', Px, Py, Pz);