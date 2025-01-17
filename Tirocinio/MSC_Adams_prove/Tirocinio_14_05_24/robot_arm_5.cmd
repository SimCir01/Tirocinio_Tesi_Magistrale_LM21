! CMD Version:2
! Version 2 enables expanded acceptable characters for object names.
! If unspecified, set to 1 or set to an invalid value, Adams View assumes traditional naming requirements.
!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = mm  &
   angle = deg  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 10.0  &
   spacing_for_grid = 1000.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = robot_arm
!
model attributes  &
   model_name = .robot_arm  &
   size_of_icons = 10.0
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .robot_arm.steel  &
   adams_id = 1  &
   density = 7.801E-06  &
   youngs_modulus = 2.07E+05  &
   poissons_ratio = 0.29
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.ground.MARKER_21  &
   adams_id = 21  &
   location = 0.0, -25.0, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.ground.MARKER_38  &
   adams_id = 38  &
   location = 300.0, -2.5, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.ground.MARKER_40  &
   adams_id = 40  &
   location = 0.0, -2.5, -300.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.ground.MARKER_77  &
   adams_id = 77  &
   location = 0.0, -25.0, 0.0  &
   orientation = 180.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.ground.MARKER_79  &
   adams_id = 79  &
   location = 0.0, -25.0, 0.0  &
   orientation = 180.0d, 90.0d, 90.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.ground  &
   material_type = .robot_arm.steel
!
part attributes  &
   part_name = .robot_arm.ground  &
   name_visibility = off  &
   size_of_icons = 10.0
!
!--------------------------------- lower_link ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
part create rigid_body name_and_position  &
   part_name = .robot_arm.lower_link  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.lower_link
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.lower_link.MARKER_1  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.lower_link.MARKER_1  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.lower_link.MARKER_2  &
   adams_id = 2  &
   location = 0.0, 150.0, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.lower_link.MARKER_2  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.lower_link.cm  &
   adams_id = 26  &
   location = 0.0, 75.0, 0.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.lower_link.cm  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.lower_link.MARKER_7  &
   adams_id = 7  &
   location = 0.0, 150.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.lower_link.MARKER_7  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.lower_link.MARKER_8  &
   adams_id = 8  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.lower_link.MARKER_8  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.lower_link.MARKER_53  &
   adams_id = 53  &
   location = 0.0, 150.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.lower_link.MARKER_54  &
   adams_id = 54  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.lower_link.MARKER_65  &
   adams_id = 65  &
   location = 0.0, 150.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.lower_link.MARKER_66  &
   adams_id = 66  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.lower_link  &
   material_type = .robot_arm.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .robot_arm.lower_link.LINK_1  &
   i_marker = .robot_arm.lower_link.MARKER_1  &
   j_marker = .robot_arm.lower_link.MARKER_2  &
   width = 40.0  &
   depth = 40.0
!
part attributes  &
   part_name = .robot_arm.lower_link  &
   color = RED  &
   name_visibility = off  &
   size_of_icons = 10.0
!
!-------------------------------- middle_link ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
part create rigid_body name_and_position  &
   part_name = .robot_arm.middle_link  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.middle_link
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.middle_link.MARKER_3  &
   adams_id = 3  &
   location = 0.0, 150.0, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.middle_link.MARKER_3  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.middle_link.MARKER_4  &
   adams_id = 4  &
   location = 0.0, 250.0, 0.0  &
   orientation = 90.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.middle_link.MARKER_4  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.middle_link.cm  &
   adams_id = 27  &
   location = 0.0, 200.0, 0.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.middle_link.cm  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.middle_link.MARKER_6  &
   adams_id = 6  &
   location = 0.0, 150.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.middle_link.MARKER_6  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.middle_link.MARKER_19  &
   adams_id = 19  &
   location = 0.0, 250.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.middle_link.MARKER_52  &
   adams_id = 52  &
   location = 0.0, 150.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.middle_link.MARKER_57  &
   adams_id = 57  &
   location = 0.0, 250.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.middle_link.MARKER_64  &
   adams_id = 64  &
   location = 0.0, 150.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.middle_link.MARKER_69  &
   adams_id = 69  &
   location = 0.0, 250.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.middle_link  &
   material_type = .robot_arm.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .robot_arm.middle_link.LINK_2  &
   i_marker = .robot_arm.middle_link.MARKER_3  &
   j_marker = .robot_arm.middle_link.MARKER_4  &
   width = 30.0  &
   depth = 30.0
!
part attributes  &
   part_name = .robot_arm.middle_link  &
   color = GREEN  &
   name_visibility = off  &
   size_of_icons = 10.0
!
!------------------------------------ base ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
part create rigid_body name_and_position  &
   part_name = .robot_arm.base  &
   adams_id = 4  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.base
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.base.MARKER_5  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.base.MARKER_5  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.base.cm  &
   adams_id = 28  &
   location = 0.0, -25.0, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.base.cm  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.base.MARKER_9  &
   adams_id = 9  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .robot_arm.base.MARKER_9  &
   size_of_icons = 10.0
!
marker create  &
   marker_name = .robot_arm.base.MARKER_20  &
   adams_id = 20  &
   location = 0.0, -25.0, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.base.MARKER_55  &
   adams_id = 55  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.base.MARKER_67  &
   adams_id = 67  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.base.MARKER_76  &
   adams_id = 76  &
   location = 0.0, -25.0, 0.0  &
   orientation = 180.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.base.MARKER_78  &
   adams_id = 78  &
   location = 0.0, -25.0, 0.0  &
   orientation = 180.0d, 90.0d, 90.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.base  &
   material_type = .robot_arm.steel
!
! ****** Graphics for current part ******
!
geometry create shape cylinder  &
   cylinder_name = .robot_arm.base.CYLINDER_3  &
   adams_id = 3  &
   center_marker = .robot_arm.base.MARKER_5  &
   angle_extent = 360.0  &
   length = 50.0  &
   radius = 30.0  &
   side_count_for_body = 20  &
   segment_count_for_ends = 20
!
part attributes  &
   part_name = .robot_arm.base  &
   color = CYAN  &
   name_visibility = off  &
   size_of_icons = 10.0
!
!------------------------------ manipulator_base ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
part create rigid_body name_and_position  &
   part_name = .robot_arm.manipulator_base  &
   adams_id = 5  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.manipulator_base
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_10  &
   adams_id = 10  &
   location = 0.0, 250.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_11  &
   adams_id = 11  &
   location = 0.0, 300.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.cm  &
   adams_id = 29  &
   location = 0.0, 284.4172101003, 0.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_16  &
   adams_id = 16  &
   location = 0.0, 300.0, 25.0  &
   orientation = 270.0d, 90.0d, 270.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_17  &
   adams_id = 17  &
   location = 0.0, 300.0, -25.0  &
   orientation = 270.0d, 90.0d, 270.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_18  &
   adams_id = 18  &
   location = 0.0, 250.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_23  &
   adams_id = 23  &
   location = 0.0, 300.0, 25.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_25  &
   adams_id = 25  &
   location = 0.0, 300.0, -25.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_42  &
   adams_id = 42  &
   location = 0.0, 300.0, -25.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_50  &
   adams_id = 50  &
   location = 0.0, 300.0, -25.0  &
   orientation = 90.0d, 90.0d, 270.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_56  &
   adams_id = 56  &
   location = 0.0, 250.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_82  &
   adams_id = 82  &
   location = 0.0, 300.0, -25.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_68  &
   adams_id = 68  &
   location = 0.0, 250.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_72  &
   adams_id = 72  &
   location = 0.0, 300.0, 25.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.manipulator_base.MARKER_80  &
   adams_id = 80  &
   location = 0.0, 300.0, 25.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.manipulator_base  &
   material_type = .robot_arm.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .robot_arm.manipulator_base.LINK_4  &
   i_marker = .robot_arm.manipulator_base.MARKER_10  &
   j_marker = .robot_arm.manipulator_base.MARKER_11  &
   width = 25.0  &
   depth = 25.0
!
geometry attributes  &
   geometry_name = .robot_arm.manipulator_base.LINK_4  &
   transparency = 50
!
geometry create shape link  &
   link_name = .robot_arm.manipulator_base.LINK_7  &
   i_marker = .robot_arm.manipulator_base.MARKER_16  &
   j_marker = .robot_arm.manipulator_base.MARKER_17  &
   width = 20.0  &
   depth = 20.0
!
geometry attributes  &
   geometry_name = .robot_arm.manipulator_base.LINK_7  &
   transparency = 50
!
part attributes  &
   part_name = .robot_arm.manipulator_base  &
   color = MAGENTA  &
   name_visibility = off
!
!------------------------------- gripper_right --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
part create rigid_body name_and_position  &
   part_name = .robot_arm.gripper_right  &
   adams_id = 6  &
   location = 0.0, 0.0, 5.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.gripper_right
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.gripper_right.MARKER_12  &
   adams_id = 12  &
   location = 0.0, 300.0, -30.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.gripper_right.MARKER_13  &
   adams_id = 13  &
   location = 0.0, 350.0, -30.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.gripper_right.cm  &
   adams_id = 30  &
   location = 0.0, 325.0, -30.0  &
   orientation = 180.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.gripper_right.MARKER_24  &
   adams_id = 24  &
   location = 0.0, 300.0, -30.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.gripper_right.MARKER_41  &
   adams_id = 41  &
   location = 0.0, 300.0, -30.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.gripper_right.MARKER_51  &
   adams_id = 51  &
   location = 0.0, 300.0, -30.0  &
   orientation = 90.0d, 90.0d, 270.0d
!
marker create  &
   marker_name = .robot_arm.gripper_right.MARKER_83  &
   adams_id = 83  &
   location = 0.0, 300.0, -30.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.gripper_right  &
   material_type = .robot_arm.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .robot_arm.gripper_right.LINK_5  &
   i_marker = .robot_arm.gripper_right.MARKER_12  &
   j_marker = .robot_arm.gripper_right.MARKER_13  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .robot_arm.gripper_right  &
   color = RED  &
   name_visibility = off
!
!-------------------------------- gripper_left --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
part create rigid_body name_and_position  &
   part_name = .robot_arm.gripper_left  &
   adams_id = 7  &
   location = 0.0, 0.0, -5.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.gripper_left
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.gripper_left.MARKER_14  &
   adams_id = 14  &
   location = 0.0, 300.0, 30.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.gripper_left.MARKER_15  &
   adams_id = 15  &
   location = 0.0, 350.0, 30.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.gripper_left.cm  &
   adams_id = 31  &
   location = 0.0, 325.0, 30.0  &
   orientation = 180.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.gripper_left.MARKER_22  &
   adams_id = 22  &
   location = 0.0, 300.0, 30.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.gripper_left.MARKER_73  &
   adams_id = 73  &
   location = 0.0, 300.0, 30.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .robot_arm.gripper_left.MARKER_81  &
   adams_id = 81  &
   location = 0.0, 300.0, 30.0  &
   orientation = 270.0d, 90.0d, 90.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.gripper_left  &
   material_type = .robot_arm.steel
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .robot_arm.gripper_left.LINK_6  &
   i_marker = .robot_arm.gripper_left.MARKER_14  &
   j_marker = .robot_arm.gripper_left.MARKER_15  &
   width = 10.0  &
   depth = 10.0
!
part attributes  &
   part_name = .robot_arm.gripper_left  &
   color = GREEN  &
   name_visibility = off
!
!--------------------------------- platform_1 ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
part create rigid_body name_and_position  &
   part_name = .robot_arm.platform_1  &
   adams_id = 8  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.platform_1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.platform_1.MARKER_32  &
   adams_id = 32  &
   location = 200.0, 0.0, 40.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.platform_1.cm  &
   adams_id = 45  &
   location = 300.0, -2.5, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.platform_1.MARKER_37  &
   adams_id = 37  &
   location = 300.0, -2.5, 0.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.platform_1  &
   material_type = .robot_arm.steel
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .robot_arm.platform_1.BOX_8  &
   adams_id = 8  &
   corner_marker = .robot_arm.platform_1.MARKER_32  &
   diag_corner_coords = 200.0, 80.0, -5.0
!
part attributes  &
   part_name = .robot_arm.platform_1  &
   color = MAIZE  &
   name_visibility = off
!
!--------------------------------- platform_2 ---------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
part create rigid_body name_and_position  &
   part_name = .robot_arm.platform_2  &
   adams_id = 9  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.platform_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.platform_2.MARKER_33  &
   adams_id = 33  &
   location = 40.0, 0.0, -200.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.platform_2.cm  &
   adams_id = 46  &
   location = 0.0, -2.5, -300.0  &
   orientation = 90.0d, 180.0d, 0.0d
!
marker create  &
   marker_name = .robot_arm.platform_2.MARKER_39  &
   adams_id = 39  &
   location = 0.0, -2.5, -300.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.platform_2  &
   material_type = .robot_arm.steel
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .robot_arm.platform_2.BOX_9  &
   adams_id = 9  &
   corner_marker = .robot_arm.platform_2.MARKER_33  &
   diag_corner_coords = -80.0, 200.0, -5.0
!
part attributes  &
   part_name = .robot_arm.platform_2  &
   color = CYAN  &
   name_visibility = off
!
!----------------------------------- cube_1 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
part create rigid_body name_and_position  &
   part_name = .robot_arm.cube_1  &
   adams_id = 10  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.cube_1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.cube_1.MARKER_34  &
   adams_id = 34  &
   location = 220.0, 0.0, 20.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.cube_1.cm  &
   adams_id = 47  &
   location = 240.0, 20.0, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.cube_1  &
   mass = 2.0E-02  &
   center_of_mass_marker = .robot_arm.cube_1.cm  &
   ixx = 133.1370666667  &
   iyy = 133.1370666667  &
   izz = 133.1370666667  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .robot_arm.cube_1.BOX_10  &
   adams_id = 10  &
   corner_marker = .robot_arm.cube_1.MARKER_34  &
   diag_corner_coords = 40.0, 40.0, 40.0
!
part attributes  &
   part_name = .robot_arm.cube_1  &
   color = MAGENTA  &
   name_visibility = off
!
!----------------------------------- cube_2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
part create rigid_body name_and_position  &
   part_name = .robot_arm.cube_2  &
   adams_id = 11  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.cube_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.cube_2.MARKER_35  &
   adams_id = 35  &
   location = 280.0, 0.0, 20.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.cube_2.cm  &
   adams_id = 48  &
   location = 300.0, 20.0, 0.0  &
   orientation = 180.0d, 90.0d, 90.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.cube_2  &
   mass = 2.0E-02  &
   center_of_mass_marker = .robot_arm.cube_2.cm  &
   ixx = 133.1370666667  &
   iyy = 133.1370666667  &
   izz = 133.1370666667  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .robot_arm.cube_2.BOX_11  &
   adams_id = 11  &
   corner_marker = .robot_arm.cube_2.MARKER_35  &
   diag_corner_coords = 40.0, 40.0, 40.0
!
part attributes  &
   part_name = .robot_arm.cube_2  &
   color = RED  &
   name_visibility = off
!
!----------------------------------- cube_3 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
part create rigid_body name_and_position  &
   part_name = .robot_arm.cube_3  &
   adams_id = 12  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.cube_3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .robot_arm.cube_3.MARKER_36  &
   adams_id = 36  &
   location = 340.0, 0.0, 20.0  &
   orientation = 180.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .robot_arm.cube_3.cm  &
   adams_id = 49  &
   location = 360.0, 20.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .robot_arm.cube_3  &
   mass = 2.0E-02  &
   center_of_mass_marker = .robot_arm.cube_3.cm  &
   ixx = 133.1370666667  &
   iyy = 133.1370666667  &
   izz = 133.1370666667  &
   ixy = 0.0  &
   izx = 0.0  &
   iyz = 0.0
!
! ****** Graphics for current part ******
!
geometry create shape block  &
   block_name = .robot_arm.cube_3.BOX_12  &
   adams_id = 12  &
   corner_marker = .robot_arm.cube_3.MARKER_36  &
   diag_corner_coords = 40.0, 40.0, 40.0
!
part attributes  &
   part_name = .robot_arm.cube_3  &
   color = GREEN  &
   name_visibility = off
!
!---------------------------------- Contacts ----------------------------------!
!
!
contact create  &
   contact_name = .robot_arm.CONTACT_1  &
   adams_id = 1  &
   i_geometry_name = .robot_arm.cube_1.BOX_10  &
   j_geometry_name = .robot_arm.platform_1.BOX_8  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1
!
contact create  &
   contact_name = .robot_arm.CONTACT_2  &
   adams_id = 2  &
   i_geometry_name = .robot_arm.cube_2.BOX_11  &
   j_geometry_name = .robot_arm.platform_1.BOX_8  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1
!
contact create  &
   contact_name = .robot_arm.CONTACT_3  &
   adams_id = 3  &
   i_geometry_name = .robot_arm.cube_3.BOX_12  &
   j_geometry_name = .robot_arm.platform_1.BOX_8  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1
!
contact create  &
   contact_name = .robot_arm.CONTACT_4  &
   adams_id = 4  &
   i_geometry_name = .robot_arm.cube_1.BOX_10  &
   j_geometry_name = .robot_arm.platform_2.BOX_9  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1
!
contact create  &
   contact_name = .robot_arm.CONTACT_5  &
   adams_id = 5  &
   i_geometry_name = .robot_arm.cube_2.BOX_11  &
   j_geometry_name = .robot_arm.platform_2.BOX_9  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1
!
contact create  &
   contact_name = .robot_arm.CONTACT_6  &
   adams_id = 6  &
   i_geometry_name = .robot_arm.cube_3.BOX_12  &
   j_geometry_name = .robot_arm.platform_2.BOX_9  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1
!
contact create  &
   contact_name = .robot_arm.gripper_contact_left  &
   adams_id = 7  &
   type = solid_to_solid  &
   i_geometry_name = .robot_arm.gripper_left.LINK_6  &
   j_geometry_name = .robot_arm.cube_1.BOX_10  &
   stiffness = 1.0E+05  &
   damping = 1000.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 1.0  &
   mu_dynamic = 0.7  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
contact create  &
   contact_name = .robot_arm.gripper_contact_right  &
   adams_id = 8  &
   i_geometry_name = .robot_arm.gripper_right.LINK_5  &
   j_geometry_name = .robot_arm.cube_1.BOX_10  &
   stiffness = 1.0E+05  &
   damping = 1000.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 1.0  &
   mu_dynamic = 0.7  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
contact create  &
   contact_name = .robot_arm.left_gripper_contact_box2  &
   adams_id = 9  &
   type = solid_to_solid  &
   i_geometry_name = .robot_arm.gripper_left.LINK_6  &
   j_geometry_name = .robot_arm.cube_2.BOX_11  &
   stiffness = 1.0E+05  &
   damping = 1000.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 1.0  &
   mu_dynamic = 0.7  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
contact create  &
   contact_name = .robot_arm.right_gripper_contact_box2  &
   adams_id = 10  &
   type = solid_to_solid  &
   i_geometry_name = .robot_arm.gripper_right.LINK_5  &
   j_geometry_name = .robot_arm.cube_2.BOX_11  &
   stiffness = 1.0E+05  &
   damping = 1000.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 1.0  &
   mu_dynamic = 0.7  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
contact create  &
   contact_name = .robot_arm.CONTACT_box_1_2  &
   adams_id = 11  &
   type = solid_to_solid  &
   i_geometry_name = .robot_arm.cube_1.BOX_10  &
   j_geometry_name = .robot_arm.cube_2.BOX_11  &
   stiffness = 1.0E+05  &
   damping = 1000.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 1.0  &
   mu_dynamic = 0.7  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint revolute  &
   joint_name = .robot_arm.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .robot_arm.middle_link.MARKER_6  &
   j_marker_name = .robot_arm.lower_link.MARKER_7
!
constraint attributes  &
   constraint_name = .robot_arm.JOINT_1  &
   active = off  &
   name_visibility = off  &
   size_of_icons = 10.0
!
constraint create joint revolute  &
   joint_name = .robot_arm.JOINT_2  &
   adams_id = 2  &
   i_marker_name = .robot_arm.lower_link.MARKER_8  &
   j_marker_name = .robot_arm.base.MARKER_9
!
constraint attributes  &
   constraint_name = .robot_arm.JOINT_2  &
   active = off  &
   name_visibility = off  &
   size_of_icons = 10.0
!
constraint create joint revolute  &
   joint_name = .robot_arm.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .robot_arm.manipulator_base.MARKER_18  &
   j_marker_name = .robot_arm.middle_link.MARKER_19
!
constraint attributes  &
   constraint_name = .robot_arm.JOINT_3  &
   active = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .robot_arm.JOINT_4  &
   adams_id = 4  &
   i_marker_name = .robot_arm.base.MARKER_20  &
   j_marker_name = .robot_arm.ground.MARKER_21
!
constraint attributes  &
   constraint_name = .robot_arm.JOINT_4  &
   active = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .robot_arm.JOINT_5  &
   adams_id = 5  &
   i_marker_name = .robot_arm.gripper_left.MARKER_22  &
   j_marker_name = .robot_arm.manipulator_base.MARKER_23
!
constraint attributes  &
   constraint_name = .robot_arm.JOINT_5  &
   active = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .robot_arm.JOINT_6  &
   adams_id = 6  &
   i_marker_name = .robot_arm.gripper_right.MARKER_24  &
   j_marker_name = .robot_arm.manipulator_base.MARKER_25
!
constraint attributes  &
   constraint_name = .robot_arm.JOINT_6  &
   active = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .robot_arm.JOINT_7  &
   adams_id = 7  &
   i_marker_name = .robot_arm.platform_1.MARKER_37  &
   j_marker_name = .robot_arm.ground.MARKER_38
!
constraint attributes  &
   constraint_name = .robot_arm.JOINT_7  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .robot_arm.JOINT_8  &
   adams_id = 8  &
   i_marker_name = .robot_arm.platform_2.MARKER_39  &
   j_marker_name = .robot_arm.ground.MARKER_40
!
constraint attributes  &
   constraint_name = .robot_arm.JOINT_8  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
force create element_like bushing  &
   bushing_name = .robot_arm.BUSHING_1  &
   adams_id = 1  &
   i_marker_name = .robot_arm.middle_link.MARKER_52  &
   j_marker_name = .robot_arm.lower_link.MARKER_53  &
   damping = 1.0E+04, 1.0E+04, 1.0E+04  &
   stiffness = 1.0E+06, 1.0E+06, 1.0E+06  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 1.0E+04, 1.0E+04, 0.0  &
   tstiffness = 1.0E+06, 1.0E+06, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force create element_like bushing  &
   bushing_name = .robot_arm.BUSHING_2  &
   adams_id = 2  &
   i_marker_name = .robot_arm.lower_link.MARKER_54  &
   j_marker_name = .robot_arm.base.MARKER_55  &
   damping = 1.0E+04, 1.0E+04, 1.0E+04  &
   stiffness = 1.0E+06, 1.0E+06, 1.0E+06  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 1.0E+04, 1.0E+04, 0.0  &
   tstiffness = 1.0E+06, 1.0E+06, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force create element_like bushing  &
   bushing_name = .robot_arm.BUSHING_3  &
   adams_id = 3  &
   i_marker_name = .robot_arm.manipulator_base.MARKER_56  &
   j_marker_name = .robot_arm.middle_link.MARKER_57  &
   damping = 1.0E+04, 1.0E+04, 1.0E+04  &
   stiffness = 1.0E+06, 1.0E+06, 1.0E+06  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 1.0E+04, 1.0E+04, 0.0  &
   tstiffness = 1.0E+04, 1.0E+04, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force create element_like bushing  &
   bushing_name = .robot_arm.BUSHING_9  &
   adams_id = 9  &
   i_marker_name = .robot_arm.manipulator_base.MARKER_82  &
   j_marker_name = .robot_arm.gripper_right.MARKER_83  &
   damping = 1.0E+04, 1.0E+04, 1.0E+04  &
   stiffness = 1.0E+06, 1.0E+06, 1.0E+06  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 1.0E+04, 1.0E+04, 5.0  &
   tstiffness = 1.0E+06, 1.0E+06, 10.0  &
   torque_preload = 0.0, 0.0, -100.0
!
force create element_like bushing  &
   bushing_name = .robot_arm.BUSHING_4  &
   adams_id = 7  &
   i_marker_name = .robot_arm.base.MARKER_78  &
   j_marker_name = .robot_arm.ground.MARKER_79  &
   damping = 1.0E+04, 1.0E+04, 1.0E+04  &
   stiffness = 1.0E+06, 1.0E+06, 1.0E+06  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 1.0E+04, 1.0E+04, 0.0  &
   tstiffness = 1.0E+06, 1.0E+06, 0.0  &
   torque_preload = 0.0, 0.0, 0.0
!
force create element_like bushing  &
   bushing_name = .robot_arm.BUSHING_8  &
   adams_id = 8  &
   i_marker_name = .robot_arm.manipulator_base.MARKER_80  &
   j_marker_name = .robot_arm.gripper_left.MARKER_81  &
   damping = 1.0E+04, 1.0E+04, 1.0E+04  &
   stiffness = 1.0E+06, 1.0E+06, 1.0E+06  &
   force_preload = 0.0, 0.0, 0.0  &
   tdamping = 1.0E+04, 1.0E+04, 5.0  &
   tstiffness = 1.0E+06, 1.0E+06, 10.0  &
   torque_preload = 0.0, 0.0, 100.0
!
force create direct single_component_force  &
   single_component_force_name = .robot_arm.gripper_torque  &
   adams_id = 1  &
   type_of_freedom = rotational  &
   i_marker_name = .robot_arm.manipulator_base.MARKER_50  &
   j_marker_name = .robot_arm.gripper_right.MARKER_51  &
   action_only = off  &
   function = ""
!
force create direct single_component_force  &
   single_component_force_name = .robot_arm.gripper_torque_left  &
   adams_id = 3  &
   type_of_freedom = rotational  &
   i_marker_name = .robot_arm.manipulator_base.MARKER_72  &
   j_marker_name = .robot_arm.gripper_left.MARKER_73  &
   action_only = off  &
   function = ""
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .robot_arm.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=11.3 number_of_steps=113 model_name=.robot_arm"
!
!-------------------------- Adams View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .robot_arm.TORSION_SPRING_1  &
   definition_name = .MDI.Forces.torsion_spring  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude attributes  &
   instance_name = .robot_arm.TORSION_SPRING_1  &
   active = off
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.i_marker  &
   object_value = (.robot_arm.gripper_right.MARKER_41)
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.j_marker  &
   object_value = (.robot_arm.manipulator_base.MARKER_42)
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.stiffness_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.stiffness_coefficient  &
   real_value = (10(newton-mm/deg))
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.stiffness_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.damping_mode  &
   string_value = "linear"
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.damping_coefficient  &
   real_value = (5(newton-mm-sec/deg))
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.damping_spline  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.free_angle_mode  &
   string_value = "Design_Angle"
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.free_angle  &
   real_value = 1.0
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.preload  &
   real_value = 10.0
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.i_dynamic_visibility  &
   string_value = "on"
!
variable modify  &
   variable_name = .robot_arm.TORSION_SPRING_1.j_dynamic_visibility  &
   string_value = "off"
!
ude modify instance  &
   instance_name = .robot_arm.TORSION_SPRING_1
!
undo end_block
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .robot_arm.ground
!
geometry create shape force  &
   force_name = .robot_arm.SFORCE_3_force_graphic_1  &
   adams_id = 23  &
   force_element_name = .robot_arm.gripper_torque  &
   applied_at_marker_name = .robot_arm.manipulator_base.MARKER_50
!
geometry create shape force  &
   force_name = .robot_arm.BUSHING_1_force_graphic_1  &
   adams_id = 43  &
   force_element_name = .robot_arm.BUSHING_1  &
   applied_at_marker_name = .robot_arm.middle_link.MARKER_52
!
geometry create shape force  &
   force_name = .robot_arm.BUSHING_2_force_graphic_1  &
   adams_id = 44  &
   force_element_name = .robot_arm.BUSHING_2  &
   applied_at_marker_name = .robot_arm.lower_link.MARKER_54
!
geometry create shape force  &
   force_name = .robot_arm.BUSHING_3_force_graphic_1  &
   adams_id = 45  &
   force_element_name = .robot_arm.BUSHING_3  &
   applied_at_marker_name = .robot_arm.manipulator_base.MARKER_56
!
geometry create shape force  &
   force_name = .robot_arm.BUSHING_9_force_graphic_1  &
   adams_id = 51  &
   force_element_name = .robot_arm.BUSHING_9  &
   applied_at_marker_name = .robot_arm.manipulator_base.MARKER_82
!
geometry create shape force  &
   force_name = .robot_arm.SFORCE_3_force_graphic_2  &
   adams_id = 49  &
   force_element_name = .robot_arm.gripper_torque_left  &
   applied_at_marker_name = .robot_arm.manipulator_base.MARKER_72
!
geometry attributes  &
   geometry_name = .robot_arm.SFORCE_3_force_graphic_2  &
   active = off
!
geometry create shape force  &
   force_name = .robot_arm.BUSHING_7_force_graphic_1  &
   adams_id = 50  &
   force_element_name = .robot_arm.BUSHING_4  &
   applied_at_marker_name = .robot_arm.base.MARKER_78
!
geometry create shape force  &
   force_name = .robot_arm.BUSHING_8_force_graphic_1  &
   adams_id = 52  &
   force_element_name = .robot_arm.BUSHING_8  &
   applied_at_marker_name = .robot_arm.manipulator_base.MARKER_80
!
geometry create shape gcontact  &
   contact_force_name = .robot_arm.GCONTACT_15  &
   adams_id = 15  &
   contact_element_name = .robot_arm.CONTACT_1  &
   force_display = components
!
geometry attributes  &
   geometry_name = .robot_arm.GCONTACT_15  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .robot_arm.GCONTACT_16  &
   adams_id = 16  &
   contact_element_name = .robot_arm.CONTACT_2  &
   force_display = components
!
geometry attributes  &
   geometry_name = .robot_arm.GCONTACT_16  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .robot_arm.GCONTACT_17  &
   adams_id = 17  &
   contact_element_name = .robot_arm.CONTACT_3  &
   force_display = components
!
geometry attributes  &
   geometry_name = .robot_arm.GCONTACT_17  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .robot_arm.GCONTACT_18  &
   adams_id = 18  &
   contact_element_name = .robot_arm.CONTACT_4  &
   force_display = components
!
geometry attributes  &
   geometry_name = .robot_arm.GCONTACT_18  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .robot_arm.GCONTACT_19  &
   adams_id = 19  &
   contact_element_name = .robot_arm.CONTACT_5  &
   force_display = components
!
geometry attributes  &
   geometry_name = .robot_arm.GCONTACT_19  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .robot_arm.GCONTACT_20  &
   adams_id = 20  &
   contact_element_name = .robot_arm.CONTACT_6  &
   force_display = components
!
geometry attributes  &
   geometry_name = .robot_arm.GCONTACT_20  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .robot_arm.GCONTACT_26  &
   adams_id = 26  &
   contact_element_name = .robot_arm.gripper_contact_left  &
   force_display = components
!
geometry attributes  &
   geometry_name = .robot_arm.GCONTACT_26  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .robot_arm.GCONTACT_29  &
   adams_id = 29  &
   contact_element_name = .robot_arm.gripper_contact_right  &
   force_display = components
!
geometry attributes  &
   geometry_name = .robot_arm.GCONTACT_29  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .robot_arm.GCONTACT_34  &
   adams_id = 34  &
   contact_element_name = .robot_arm.left_gripper_contact_box2  &
   force_display = components
!
geometry attributes  &
   geometry_name = .robot_arm.GCONTACT_34  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .robot_arm.GCONTACT_37  &
   adams_id = 37  &
   contact_element_name = .robot_arm.right_gripper_contact_box2  &
   force_display = components
!
geometry attributes  &
   geometry_name = .robot_arm.GCONTACT_37  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .robot_arm.GCONTACT_40  &
   adams_id = 40  &
   contact_element_name = .robot_arm.CONTACT_box_1_2  &
   force_display = components
!
geometry attributes  &
   geometry_name = .robot_arm.GCONTACT_40  &
   color = RED
!
!---------------------------------- Couplers ----------------------------------!
!
!
constraint create complex_joint coupler  &
   coupler_name = .robot_arm.COUPLER_1  &
   adams_id = 1  &
   joint_name =  &
      .robot_arm.JOINT_5,  &
      .robot_arm.JOINT_6  &
   type_of_freedom = rot_rot  &
   motion_multipliers = -1.0, -1.0
!
constraint attributes  &
   constraint_name = .robot_arm.COUPLER_1  &
   active = off
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .robot_arm.motor_1  &
   adams_id = 1  &
   type_of_freedom = rotational  &
   joint_name = .robot_arm.JOINT_2  &
   function = ""
!
constraint attributes  &
   constraint_name = .robot_arm.motor_1  &
   active = off  &
   name_visibility = off
!
constraint create motion_generator  &
   motion_name = .robot_arm.motor_4  &
   adams_id = 2  &
   type_of_freedom = rotational  &
   joint_name = .robot_arm.JOINT_4  &
   function = ""
!
constraint attributes  &
   constraint_name = .robot_arm.motor_4  &
   active = off  &
   name_visibility = off
!
constraint create motion_generator  &
   motion_name = .robot_arm.motor_2  &
   adams_id = 3  &
   type_of_freedom = rotational  &
   joint_name = .robot_arm.JOINT_1  &
   function = ""
!
constraint attributes  &
   constraint_name = .robot_arm.motor_2  &
   active = off  &
   name_visibility = off
!
constraint create motion_generator  &
   motion_name = .robot_arm.motor_3  &
   adams_id = 4  &
   type_of_freedom = rotational  &
   joint_name = .robot_arm.JOINT_3  &
   function = ""
!
constraint attributes  &
   constraint_name = .robot_arm.motor_3  &
   active = off  &
   name_visibility = off
!
constraint create motion_generator  &
   motion_name = .robot_arm.MOTION_2  &
   adams_id = 5  &
   i_marker_name = .robot_arm.middle_link.MARKER_64  &
   j_marker_name = .robot_arm.lower_link.MARKER_65  &
   axis = b3  &
   function = ""
!
constraint attributes  &
   constraint_name = .robot_arm.MOTION_2  &
   name_visibility = off
!
constraint create motion_generator  &
   motion_name = .robot_arm.MOTION_1  &
   adams_id = 6  &
   i_marker_name = .robot_arm.lower_link.MARKER_66  &
   j_marker_name = .robot_arm.base.MARKER_67  &
   axis = b3  &
   function = ""
!
constraint attributes  &
   constraint_name = .robot_arm.MOTION_1  &
   name_visibility = off
!
constraint create motion_generator  &
   motion_name = .robot_arm.MOTION_3  &
   adams_id = 7  &
   i_marker_name = .robot_arm.manipulator_base.MARKER_68  &
   j_marker_name = .robot_arm.middle_link.MARKER_69  &
   axis = b3  &
   function = ""
!
constraint attributes  &
   constraint_name = .robot_arm.MOTION_3  &
   name_visibility = off
!
constraint create motion_generator  &
   motion_name = .robot_arm.MOTION_4  &
   adams_id = 8  &
   i_marker_name = .robot_arm.base.MARKER_76  &
   j_marker_name = .robot_arm.ground.MARKER_77  &
   axis = b3  &
   function = ""
!
constraint attributes  &
   constraint_name = .robot_arm.MOTION_4  &
   name_visibility = off
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9806.65  &
   z_component_gravity = 0.0
!
force attributes  &
   force_name = .robot_arm.gravity  &
   size_of_icons = 10.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create object  &
   measure_name = .robot_arm.motor_1_torque1  &
   from_first = yes  &
   object = .robot_arm.motor_1  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.motor_1_torque1  &
   active = off  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.motor_2_torque2  &
   from_first = yes  &
   object = .robot_arm.motor_2  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.motor_2_torque2  &
   active = off  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.motor_3_torque3  &
   from_first = yes  &
   object = .robot_arm.motor_3  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.motor_3_torque3  &
   active = off  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.motor_4_torque4  &
   from_first = yes  &
   object = .robot_arm.motor_4  &
   characteristic = element_torque  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.motor_4_torque4  &
   active = off  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.gripper_torque_MEA_1  &
   from_first = yes  &
   object = .robot_arm.gripper_torque  &
   characteristic = element_torque  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.gripper_torque_MEA_1  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.gripper_torque_left_MEA_1  &
   from_first = yes  &
   object = .robot_arm.gripper_torque_left  &
   characteristic = element_torque  &
   component = x_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.gripper_torque_left_MEA_1  &
   active = off  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_1_PR1  &
   from_first = yes  &
   object = .robot_arm.MOTION_1  &
   characteristic = ax_ay_az_projection_angles  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_1_PR1  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_1_tq1  &
   from_first = yes  &
   object = .robot_arm.MOTION_1  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_1_tq1  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_2_tq2  &
   from_first = yes  &
   object = .robot_arm.MOTION_2  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_2_tq2  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_3_tq3  &
   from_first = yes  &
   object = .robot_arm.MOTION_3  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_3_tq3  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_4_tq4  &
   from_first = yes  &
   object = .robot_arm.MOTION_4  &
   characteristic = element_torque  &
   component = y_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_4_tq4  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_1_PR_1  &
   from_first = yes  &
   object = .robot_arm.MOTION_1  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_1_PR_1  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_2_PR_2  &
   from_first = yes  &
   object = .robot_arm.MOTION_2  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_2_PR_2  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_3_PR_3  &
   from_first = yes  &
   object = .robot_arm.MOTION_3  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_3_PR_3  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_4_PR_4  &
   from_first = yes  &
   object = .robot_arm.MOTION_4  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_4_PR_4  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_1_AngVel1  &
   from_first = yes  &
   object = .robot_arm.MOTION_1  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_1_AngVel1  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_2_AngVel2  &
   from_first = yes  &
   object = .robot_arm.MOTION_2  &
   characteristic = element_torque  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_2_AngVel2  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_3_AngVel3  &
   from_first = yes  &
   object = .robot_arm.MOTION_3  &
   characteristic = angular_velocity  &
   component = z_component  &
   create_measure_display = no
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_3_AngVel3  &
   color = WHITE
!
measure create object  &
   measure_name = .robot_arm.MOTION_4_AngVel4  &
   from_first = yes  &
   object = .robot_arm.MOTION_4  &
   characteristic = element_torque  &
   component = z_component
!
data_element attributes  &
   data_element_name = .robot_arm.MOTION_4_AngVel4  &
   color = WHITE
!
measure create function  &
   measure_name = .robot_arm.Base_WY  &
   function = ""  &
   units = "no_units"
!
data_element attributes  &
   data_element_name = .robot_arm.Base_WY  &
   color = WHITE
!
measure create function  &
   measure_name = .robot_arm.FUNCTION_AZ_1  &
   function = ""  &
   units = "no_units"
!
data_element attributes  &
   data_element_name = .robot_arm.FUNCTION_AZ_1  &
   color = WHITE
!
measure create function  &
   measure_name = .robot_arm.FUNCTION_AZ_2  &
   function = ""  &
   units = "no_units"
!
data_element attributes  &
   data_element_name = .robot_arm.FUNCTION_AZ_2  &
   color = WHITE
!
measure create function  &
   measure_name = .robot_arm.FUNCTION_AZ_3  &
   function = ""  &
   units = "no_units"
!
data_element attributes  &
   data_element_name = .robot_arm.FUNCTION_AZ_3  &
   color = WHITE
!
measure create computed  &
   measure_name = .robot_arm.FunctionBuilderMeasureInd  &
   text_of_expression = "0"  &
   create_measure_display = no
!
entity attributes  &
   entity_name = .robot_arm.FunctionBuilderMeasureInd  &
   color = WHITE
!
measure create computed  &
   measure_name = .robot_arm.FunctionBuilderMeasure  &
   text_of_expression = "0"  &
   create_measure_display = no
!
entity attributes  &
   entity_name = .robot_arm.FunctionBuilderMeasure  &
   color = WHITE
!
!---------------------------- Adams View Variables ----------------------------!
!
!
variable create  &
   variable_name = .robot_arm.tqgr  &
   units = "no_units"  &
   range = -1.0, 1.0  &
   use_allowed_values = no  &
   delta_type = relative  &
   real_value = 800.0
!
variable create  &
   variable_name = .robot_arm.preload  &
   units = "no_units"  &
   range = -1.0, 1.0  &
   use_allowed_values = no  &
   delta_type = relative  &
   real_value = 100.0
!
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .robot_arm.motor_1  &
   function = "step(time,0,0d,1,-40d)+step(time,2,0d,3,20d)+step(time,3,0d,4,-20d)+step(time,4.1,0d,5,20d)+step(time,6,0d,7,-35d)+step(time,8,0d,9,40d)+step(time,10,0d,11,-9d)"
!
constraint modify motion_generator  &
   motion_name = .robot_arm.motor_4  &
   function = "step(time, 2.5, 0.0d, 3.5, 90.0d)+STEP(time, 5.1, 0.0d, 6.0, -90.0d)+STEP(time, 8.5, 0.0d, 9.5, 90.0d)"
!
constraint modify motion_generator  &
   motion_name = .robot_arm.motor_2  &
   function = "step(time,0,0d,1,-110d)+step(time,2,0d,3,40d)+step(time,3,0d,4,-40d)+step(time,4.1,0d,5,40d)+step(time,6,0d,7,-5d)+step(time,8,0d,9,-10d)+step(time,10,0d,11,-19d)"
!
constraint modify motion_generator  &
   motion_name = .robot_arm.motor_3  &
   function = "step(time,0,0d,1,60d)+step(time,2,0d,3,-60d)+step(time,3,0d,4,60d)+step(time,4.1,0d,5,-60d)+step(time,6,0d,7,40d)+step(time,8,0d,9,-60d)+step(time,10,0d,11,60d)"
!
constraint modify motion_generator  &
   motion_name = .robot_arm.MOTION_2  &
   function = "step(time,0,0d,1,-110d)+step(time,2,0d,3,40d)+step(time,3,0d,4,-40d)+step(time,4.1,0d,5,40d)+step(time,6,0d,7,-5d)+step(time,8,0d,9,-10d)+step(time,10,0d,11,-19d)"
!
constraint modify motion_generator  &
   motion_name = .robot_arm.MOTION_1  &
   function = "step(time,0,0d,1,-40d)+step(time,2,0d,3,20d)+step(time,3,0d,4,-20d)+step(time,4.1,0d,5,20d)+step(time,6,0d,7,-35d)+step(time,8,0d,9,40d)+step(time,10,0d,11,-9d)"
!
constraint modify motion_generator  &
   motion_name = .robot_arm.MOTION_3  &
   function = "step(time,0,0d,1,60d)+step(time,2,0d,3,-60d)+step(time,3,0d,4,60d)+step(time,4.1,0d,5,-60d)+step(time,6,0d,7,40d)+step(time,8,0d,9,-60d)+step(time,10,0d,11,60d)"
!
constraint modify motion_generator  &
   motion_name = .robot_arm.MOTION_4  &
   function = "step(time, 2.5, 0.0d, 3.5, 90.0d)+STEP(time, 5.1, 0.0d, 6.0, -90.0d)+STEP(time, 8.5, 0.0d, 9.5, 90.0d)"
!
measure modify function  &
   measure_name = .robot_arm.Base_WY  &
   function = "WZ(.robot_arm.base.MARKER_20,.robot_arm.ground.MARKER_21,.robot_arm.ground.MARKER_21)"
!
measure_display create  &
   mea_display = .robot_arm.Base_WZ_display  &
   measure_name = .robot_arm.Base_WY
!
measure modify function  &
   measure_name = .robot_arm.FUNCTION_AZ_1  &
   function = "AZ(.robot_arm.base.MARKER_67, .robot_arm.lower_link.MARKER_66)"
!
measure_display create  &
   mea_display = .robot_arm.FUNCTION_MEA_1_display  &
   measure_name = .robot_arm.FUNCTION_AZ_1
!
measure modify function  &
   measure_name = .robot_arm.FUNCTION_AZ_2  &
   function = "AZ(.robot_arm.lower_link.MARKER_65, .robot_arm.middle_link.MARKER_64)"
!
measure_display create  &
   mea_display = .robot_arm.FUNCTION_AZ_2_display  &
   measure_name = .robot_arm.FUNCTION_AZ_2
!
measure modify function  &
   measure_name = .robot_arm.FUNCTION_AZ_3  &
   function = "AZ(.robot_arm.middle_link.MARKER_69, .robot_arm.manipulator_base.MARKER_68)"
!
measure_display create  &
   mea_display = .robot_arm.FUNCTION_AZ_3_display  &
   measure_name = .robot_arm.FUNCTION_AZ_3
!
force modify direct single_component_force  &
   single_component_force_name = .robot_arm.gripper_torque  &
   function = "step(time,1,0,1.1,-.robot_arm.tqgr)+STEP(time, 4.0, 0.0, 4.1, .robot_arm.tqgr)+STEP(time, 7.1, 0.0, 8.0, -.robot_arm.tqgr)+STEP(time, 11, 0.0, 11.1, .robot_arm.tqgr)"
!
force modify direct single_component_force  &
   single_component_force_name = .robot_arm.gripper_torque_left  &
   function = "-SFORCE(.robot_arm.gripper_torque, 0, 5, 0)"
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .robot_arm.TORSION_SPRING_1
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
material modify  &
   material_name = .robot_arm.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
geometry modify shape link  &
   link_name = .robot_arm.lower_link.LINK_1  &
   width = (40.0mm)  &
   depth = (40mm)
!
geometry modify shape link  &
   link_name = .robot_arm.middle_link.LINK_2  &
   width = (30.0mm)  &
   depth = (30.0mm)
!
geometry modify shape cylinder  &
   cylinder_name = .robot_arm.base.CYLINDER_3  &
   length = (50.0mm)  &
   radius = (30mm)
!
geometry modify shape link  &
   link_name = .robot_arm.manipulator_base.LINK_4  &
   width = (25.0mm)  &
   depth = (25mm)
!
geometry modify shape link  &
   link_name = .robot_arm.manipulator_base.LINK_7  &
   width = (20mm)  &
   depth = (20mm)
!
geometry modify shape link  &
   link_name = .robot_arm.gripper_right.LINK_5  &
   width = (10mm)  &
   depth = (10mm)
!
geometry modify shape link  &
   link_name = .robot_arm.gripper_left.LINK_6  &
   width = (10mm)  &
   depth = (10mm)
!
geometry modify shape block  &
   block_name = .robot_arm.platform_1.BOX_8  &
   diag_corner_coords =   &
      (200.0mm),  &
      (80.0mm),  &
      (-5.0mm)
!
geometry modify shape block  &
   block_name = .robot_arm.platform_2.BOX_9  &
   diag_corner_coords =   &
      (-80.0mm),  &
      (200.0mm),  &
      (-5.0mm)
!
geometry modify shape block  &
   block_name = .robot_arm.cube_1.BOX_10  &
   diag_corner_coords =   &
      (4.0cm),  &
      (4.0cm),  &
      (4.0cm)
!
part modify rigid_body mass_properties  &
   part_name = .robot_arm.cube_1  &
   mass = (20g)
!
geometry modify shape block  &
   block_name = .robot_arm.cube_2.BOX_11  &
   diag_corner_coords =   &
      (4.0cm),  &
      (4.0cm),  &
      (4.0cm)
!
part modify rigid_body mass_properties  &
   part_name = .robot_arm.cube_2  &
   mass = (20g)
!
geometry modify shape block  &
   block_name = .robot_arm.cube_3.BOX_12  &
   diag_corner_coords =   &
      (4.0cm),  &
      (4.0cm),  &
      (4.0cm)
!
part modify rigid_body mass_properties  &
   part_name = .robot_arm.cube_3  &
   mass = (20g)
!
geometry modify shape force  &
   force_name = .robot_arm.SFORCE_3_force_graphic_1  &
   applied_at_marker_name = (.robot_arm.gripper_torque.i)
!
geometry modify shape force  &
   force_name = .robot_arm.BUSHING_1_force_graphic_1  &
   applied_at_marker_name = (.robot_arm.BUSHING_1.i)
!
geometry modify shape force  &
   force_name = .robot_arm.BUSHING_2_force_graphic_1  &
   applied_at_marker_name = (.robot_arm.BUSHING_2.i)
!
geometry modify shape force  &
   force_name = .robot_arm.BUSHING_3_force_graphic_1  &
   applied_at_marker_name = (.robot_arm.BUSHING_3.i)
!
geometry modify shape force  &
   force_name = .robot_arm.SFORCE_3_force_graphic_2  &
   applied_at_marker_name = (.robot_arm.gripper_torque_left.i)
!
geometry modify shape force  &
   force_name = .robot_arm.BUSHING_7_force_graphic_1  &
   applied_at_marker_name = (.robot_arm.BUSHING_4.i)
!
force modify element_like bushing  &
   bushing_name = .robot_arm.BUSHING_8  &
   torque_preload =   &
      0.0,  &
      0.0,  &
      (.robot_arm.preload)
!
geometry modify shape force  &
   force_name = .robot_arm.BUSHING_8_force_graphic_1  &
   applied_at_marker_name = (.robot_arm.BUSHING_8.i)
!
force modify element_like bushing  &
   bushing_name = .robot_arm.BUSHING_9  &
   torque_preload =   &
      0.0,  &
      0.0,  &
      (-.robot_arm.preload)
!
geometry modify shape force  &
   force_name = .robot_arm.BUSHING_9_force_graphic_1  &
   applied_at_marker_name = (.robot_arm.BUSHING_9.i)
!
measure modify computed  &
   measure_name = .robot_arm.FunctionBuilderMeasureInd  &
   text_of_expression = "0"
!
measure modify computed  &
   measure_name = .robot_arm.FunctionBuilderMeasure  &
   text_of_expression = "0"
!
model display  &
   model_name = robot_arm
