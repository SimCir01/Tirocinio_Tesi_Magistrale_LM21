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
   size_of_icons = 50.0  &
   spacing_for_grid = 1000.0
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = MODEL_1
!
view erase
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .MODEL_1.steel  &
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
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.ground  &
   material_type = .MODEL_1.steel
!
part attributes  &
   part_name = .MODEL_1.ground  &
   name_visibility = off
!
!----------------------------------- PART_2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part create rigid_body name_and_position  &
   part_name = .MODEL_1.PART_2  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.PART_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .MODEL_1.PART_2.MARKER_1  &
   adams_id = 1  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.PART_2.MARKER_2  &
   adams_id = 2  &
   location = 100.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .MODEL_1.PART_2.cm  &
   location = 50.0, 0.0, 0.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .MODEL_1.PART_2  &
   density = 7.801E-06
!
! ****** Graphics for current part ******
!
geometry create shape link  &
   link_name = .MODEL_1.PART_2.LINK_1  &
   i_marker = .MODEL_1.PART_2.MARKER_1  &
   j_marker = .MODEL_1.PART_2.MARKER_2  &
   width = 5.0  &
   depth = 5.0
!
part attributes  &
   part_name = .MODEL_1.PART_2  &
   color = GREEN  &
   visibility = on  &
   name_visibility = on  &
   size_of_icons = 25.0
!
!----------------------------------- Forces -----------------------------------!
!
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
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------------- Measures ----------------------------------!
!
!
measure create point  &
   measure_name = .MODEL_1.MARKER_2_traslazione_x  &
   point = .MODEL_1.PART_2.MARKER_2  &
   characteristic = translational_displacement  &
   component = x_component
!
data_element attributes  &
   data_element_name = .MODEL_1.MARKER_2_traslazione_x  &
   color = WHITE
!
!---------------------------- Function definitions ----------------------------!
!
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .MODEL_1.PART_2.MARKER_2  &
   location =   &
      (LOC_RELATIVE_TO({100mm, 0.0, 0.0}, .MODEL_1.PART_2.MARKER_1))  &
   orientation =   &
      (ORI_RELATIVE_TO({{0, 0, 0}}, .MODEL_1.PART_2.MARKER_1))  &
   relative_to = .MODEL_1.PART_2
!
defaults coordinate_system  &
   default_coordinate_system = .MODEL_1.ground
!
part modify rigid_body mass_properties  &
   part_name = .MODEL_1.PART_2  &
   density = (7801.0(kg/meter**3))
!
material modify  &
   material_name = .MODEL_1.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
model display  &
   model_name = MODEL_1
