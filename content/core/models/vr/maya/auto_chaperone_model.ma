//Maya ASCII 2014 scene
//Name: auto_chaperone_model.ma
//Last modified: Tue, Jul 29, 2014 02:10:37 PM
//Codeset: 1252
requires maya "2014";
requires -nodeType "mentalrayFramebuffer" -nodeType "mentalrayOutputPass" -nodeType "mentalrayRenderPass"
		 -nodeType "mentalrayUserBuffer" -nodeType "mentalraySubdivApprox" -nodeType "mentalrayCurveApprox"
		 -nodeType "mentalraySurfaceApprox" -nodeType "mentalrayDisplaceApprox" -nodeType "mentalrayOptions"
		 -nodeType "mentalrayGlobals" -nodeType "mentalrayItemsList" -nodeType "mentalrayShader"
		 -nodeType "mentalrayUserData" -nodeType "mentalrayText" -nodeType "mentalrayTessellation"
		 -nodeType "mentalrayPhenomenon" -nodeType "mentalrayLightProfile" -nodeType "mentalrayVertexColors"
		 -nodeType "mentalrayIblShape" -nodeType "mapVizShape" -nodeType "mentalrayCCMeshProxy"
		 -nodeType "cylindricalLightLocator" -nodeType "discLightLocator" -nodeType "rectangularLightLocator"
		 -nodeType "sphericalLightLocator" -nodeType "abcimport" -nodeType "mia_physicalsun"
		 -nodeType "mia_physicalsky" -nodeType "mia_material" -nodeType "mia_material_x" -nodeType "mia_roundcorners"
		 -nodeType "mia_exposure_simple" -nodeType "mia_portal_light" -nodeType "mia_light_surface"
		 -nodeType "mia_exposure_photographic" -nodeType "mia_exposure_photographic_rev" -nodeType "mia_lens_bokeh"
		 -nodeType "mia_envblur" -nodeType "mia_ciesky" -nodeType "mia_photometric_light"
		 -nodeType "mib_texture_vector" -nodeType "mib_texture_remap" -nodeType "mib_texture_rotate"
		 -nodeType "mib_bump_basis" -nodeType "mib_bump_map" -nodeType "mib_passthrough_bump_map"
		 -nodeType "mib_bump_map2" -nodeType "mib_lookup_spherical" -nodeType "mib_lookup_cube1"
		 -nodeType "mib_lookup_cube6" -nodeType "mib_lookup_background" -nodeType "mib_lookup_cylindrical"
		 -nodeType "mib_texture_lookup" -nodeType "mib_texture_lookup2" -nodeType "mib_texture_filter_lookup"
		 -nodeType "mib_texture_checkerboard" -nodeType "mib_texture_polkadot" -nodeType "mib_texture_polkasphere"
		 -nodeType "mib_texture_turbulence" -nodeType "mib_texture_wave" -nodeType "mib_reflect"
		 -nodeType "mib_refract" -nodeType "mib_transparency" -nodeType "mib_continue" -nodeType "mib_opacity"
		 -nodeType "mib_twosided" -nodeType "mib_refraction_index" -nodeType "mib_dielectric"
		 -nodeType "mib_ray_marcher" -nodeType "mib_illum_lambert" -nodeType "mib_illum_phong"
		 -nodeType "mib_illum_ward" -nodeType "mib_illum_ward_deriv" -nodeType "mib_illum_blinn"
		 -nodeType "mib_illum_cooktorr" -nodeType "mib_illum_hair" -nodeType "mib_volume"
		 -nodeType "mib_color_alpha" -nodeType "mib_color_average" -nodeType "mib_color_intensity"
		 -nodeType "mib_color_interpolate" -nodeType "mib_color_mix" -nodeType "mib_color_spread"
		 -nodeType "mib_geo_cube" -nodeType "mib_geo_torus" -nodeType "mib_geo_sphere" -nodeType "mib_geo_cone"
		 -nodeType "mib_geo_cylinder" -nodeType "mib_geo_square" -nodeType "mib_geo_instance"
		 -nodeType "mib_geo_instance_mlist" -nodeType "mib_geo_add_uv_texsurf" -nodeType "mib_photon_basic"
		 -nodeType "mib_light_infinite" -nodeType "mib_light_point" -nodeType "mib_light_spot"
		 -nodeType "mib_light_photometric" -nodeType "mib_cie_d" -nodeType "mib_blackbody"
		 -nodeType "mib_shadow_transparency" -nodeType "mib_lens_stencil" -nodeType "mib_lens_clamp"
		 -nodeType "mib_lightmap_write" -nodeType "mib_lightmap_sample" -nodeType "mib_amb_occlusion"
		 -nodeType "mib_fast_occlusion" -nodeType "mib_map_get_scalar" -nodeType "mib_map_get_integer"
		 -nodeType "mib_map_get_vector" -nodeType "mib_map_get_color" -nodeType "mib_map_get_transform"
		 -nodeType "mib_map_get_scalar_array" -nodeType "mib_map_get_integer_array" -nodeType "mib_fg_occlusion"
		 -nodeType "mib_bent_normal_env" -nodeType "mib_glossy_reflection" -nodeType "mib_glossy_refraction"
		 -nodeType "builtin_bsdf_architectural" -nodeType "builtin_bsdf_architectural_comp"
		 -nodeType "builtin_bsdf_carpaint" -nodeType "builtin_bsdf_ashikhmin" -nodeType "builtin_bsdf_lambert"
		 -nodeType "builtin_bsdf_mirror" -nodeType "builtin_bsdf_phong" -nodeType "contour_store_function"
		 -nodeType "contour_store_function_simple" -nodeType "contour_contrast_function_levels"
		 -nodeType "contour_contrast_function_simple" -nodeType "contour_shader_simple" -nodeType "contour_shader_silhouette"
		 -nodeType "contour_shader_maxcolor" -nodeType "contour_shader_curvature" -nodeType "contour_shader_factorcolor"
		 -nodeType "contour_shader_depthfade" -nodeType "contour_shader_framefade" -nodeType "contour_shader_layerthinner"
		 -nodeType "contour_shader_widthfromcolor" -nodeType "contour_shader_widthfromlightdir"
		 -nodeType "contour_shader_widthfromlight" -nodeType "contour_shader_combi" -nodeType "contour_only"
		 -nodeType "contour_composite" -nodeType "contour_ps" -nodeType "mi_metallic_paint"
		 -nodeType "mi_metallic_paint_x" -nodeType "mi_bump_flakes" -nodeType "mi_car_paint_phen"
		 -nodeType "mi_metallic_paint_output_mixer" -nodeType "mi_car_paint_phen_x" -nodeType "physical_lens_dof"
		 -nodeType "physical_light" -nodeType "dgs_material" -nodeType "dgs_material_photon"
		 -nodeType "dielectric_material" -nodeType "dielectric_material_photon" -nodeType "oversampling_lens"
		 -nodeType "path_material" -nodeType "parti_volume" -nodeType "parti_volume_photon"
		 -nodeType "transmat" -nodeType "transmat_photon" -nodeType "mip_rayswitch" -nodeType "mip_rayswitch_advanced"
		 -nodeType "mip_rayswitch_environment" -nodeType "mip_card_opacity" -nodeType "mip_motionblur"
		 -nodeType "mip_motion_vector" -nodeType "mip_matteshadow" -nodeType "mip_cameramap"
		 -nodeType "mip_mirrorball" -nodeType "mip_grayball" -nodeType "mip_gamma_gain" -nodeType "mip_render_subset"
		 -nodeType "mip_matteshadow_mtl" -nodeType "mip_binaryproxy" -nodeType "mip_rayswitch_stage"
		 -nodeType "mip_fgshooter" -nodeType "mib_ptex_lookup" -nodeType "misss_physical"
		 -nodeType "misss_physical_phen" -nodeType "misss_fast_shader" -nodeType "misss_fast_shader_x"
		 -nodeType "misss_fast_shader2" -nodeType "misss_fast_shader2_x" -nodeType "misss_skin_specular"
		 -nodeType "misss_lightmap_write" -nodeType "misss_lambert_gamma" -nodeType "misss_call_shader"
		 -nodeType "misss_set_normal" -nodeType "misss_fast_lmap_maya" -nodeType "misss_fast_simple_maya"
		 -nodeType "misss_fast_skin_maya" -nodeType "misss_fast_skin_phen" -nodeType "misss_fast_skin_phen_d"
		 -nodeType "misss_mia_skin2_phen" -nodeType "misss_mia_skin2_phen_d" -nodeType "misss_lightmap_phen"
		 -nodeType "misss_mia_skin2_surface_phen" -nodeType "surfaceSampler" -nodeType "mib_data_bool"
		 -nodeType "mib_data_int" -nodeType "mib_data_scalar" -nodeType "mib_data_vector"
		 -nodeType "mib_data_color" -nodeType "mib_data_string" -nodeType "mib_data_texture"
		 -nodeType "mib_data_shader" -nodeType "mib_data_bool_array" -nodeType "mib_data_int_array"
		 -nodeType "mib_data_scalar_array" -nodeType "mib_data_vector_array" -nodeType "mib_data_color_array"
		 -nodeType "mib_data_string_array" -nodeType "mib_data_texture_array" -nodeType "mib_data_shader_array"
		 -nodeType "mib_data_get_bool" -nodeType "mib_data_get_int" -nodeType "mib_data_get_scalar"
		 -nodeType "mib_data_get_vector" -nodeType "mib_data_get_color" -nodeType "mib_data_get_string"
		 -nodeType "mib_data_get_texture" -nodeType "mib_data_get_shader" -nodeType "mib_data_get_shader_bool"
		 -nodeType "mib_data_get_shader_int" -nodeType "mib_data_get_shader_scalar" -nodeType "mib_data_get_shader_vector"
		 -nodeType "mib_data_get_shader_color" -nodeType "user_ibl_env" -nodeType "user_ibl_rect"
		 -nodeType "mia_material_x_passes" -nodeType "mi_metallic_paint_x_passes" -nodeType "mi_car_paint_phen_x_passes"
		 -nodeType "misss_fast_shader_x_passes" -dataType "byteArray" "Mayatomr" "2014.0 - 3.11.1.4 ";
requires -nodeType "vstExportNode" "PVstExportNode.py" "2.1.0";
requires -nodeType "ilrOptionsNode" -nodeType "ilrUIOptionsNode" -nodeType "ilrBakeLayerManager"
		 -nodeType "ilrBakeLayer" -nodeType "ilrBssrdfShader" -nodeType "ilrOccSampler" -nodeType "ilrOccData"
		 -nodeType "ilrNormalMap" -nodeType "ilrSurfaceThickness" -nodeType "ilrRaySampler"
		 -nodeType "ilrBasicPhotonShader" -nodeType "ilrPhysicPhotonShader" -nodeType "ilrDielectricPhotonShader"
		 -nodeType "ilrOrenNayarShader" -nodeType "ilrAshikhminShader" -nodeType "ilrDielectricShader"
		 -nodeType "ilrLuaNode" -nodeType "ilrHwBakeVisualizer" -nodeType "ilrShadowMask"
		 -nodeType "ilrPolyColorPerVertex" -nodeType "ilrUVMappingVisualizer" -nodeType "ilrOutputShaderBackendNode"
		 -nodeType "ilrPointCloudShape" "Turtle" "2014.0.0";
requires -nodeType "vsVmatToTex" "PVstVmatPlugin.py" "1.0";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014 x64";
fileInfo "cutIdentifier" "201303010241-864206";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 22.050987247087356 22.017937247696594 33.955542679315364 ;
	setAttr ".r" -type "double3" -28.538352729610157 32.999999999997407 1.8961883265172577e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 46.087031558362725;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0.6405693950177922 2.9626334519572906 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0.15724842539965239 0.0474137784532878 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 48.479157064324006;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "group1";
	setAttr ".s" -type "double3" 1.4356085462535977 1.4356085462535977 1.4356085462535977 ;
createNode transform -n "pPlane1" -p "group1";
	setAttr ".r" -type "double3" 90 0 0 ;
	setAttr ".s" -type "double3" 5.68598102268093 5.68598102268093 5.68598102268093 ;
createNode mesh -n "pPlaneShape1" -p "pPlane1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[0:3]" -type "float3"  0.12469338 0 0 -0.10767147 
		0 0 0.12469338 0 0 -0.10767147 0 0;
createNode transform -n "polySurface7" -p "group1";
	setAttr ".t" -type "double3" -6 6 0 ;
	setAttr ".s" -type "double3" 0.38453684507058195 0.38453684507058195 0.38453684507058195 ;
createNode mesh -n "polySurfaceShape7" -p "polySurface7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.0078289975374014609 0.43785685300827026 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "polySurfaceShape8" -p "polySurface7";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:17]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.375
		 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1
		 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".pt[0:23]" -type "float3"  -1.7508864e-007 -2.3615623 
		1.7136335e-007 1.7508864e-007 -2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		1.7136335e-007 1.7508864e-007 2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		-1.7136335e-007 1.7508864e-007 2.3615623 -1.7136335e-007 -1.7508864e-007 -2.3615623 
		-1.7136335e-007 1.7508864e-007 -2.3615623 -1.7136335e-007 -2.3615623 1.7136335e-007 
		1.7136335e-007 -2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		1.7136335e-007 2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		-1.7136335e-007 2.3615623 -1.7136335e-007 -1.7136335e-007 -2.3615623 1.7136335e-007 
		-1.7136335e-007 -2.3615623 -1.7136335e-007 -1.7136335e-007 1.7508864e-007 -1.7136335e-007 
		2.3615623 -1.7508864e-007 -1.7136335e-007 2.3615623 1.7508864e-007 -1.7136335e-007 
		-2.3615623 -1.7508864e-007 -1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		-2.3615623 -1.7508864e-007 1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		2.3615623 -1.7508864e-007 1.7136335e-007 2.3615623;
	setAttr -s 24 ".vt[0:23]"  -0.029999999 -2.83949995 0.029999999 0.029999999 -2.83949995 0.029999999
		 -0.029999999 2.83949995 0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999
		 0.029999999 2.83949995 -0.029999999 -0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 -0.029999999
		 -2.83949995 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 0.029999999
		 2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999 -0.029999999
		 -2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 0.029999999 -0.029999999 2.83949995
		 -0.029999999 -0.029999999 2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 -2.83949995
		 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 0.029999999 0.029999999 2.83949995
		 -0.029999999 0.029999999 2.83949995;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 0 9 11 0 10 12 0
		 11 13 0 12 14 0 13 15 0 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 0 17 19 0
		 18 20 0 19 21 0 20 22 0 21 23 0 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape17" -p "polySurface7";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.032190963625907898 0.53648048639297485 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.026408017
		 0.51334882 0.037973881 0.51334882 0.037973881 0.52491468 0.026408017 0.52491468 0.037973881
		 0.53648049 0.026408017 0.53648049 0.037973881 0.54804635 0.026408017 0.54804635 0.037973881
		 0.55961215 0.026408017 0.55961215 0.049539745 0.51334882 0.049539745 0.52491468 0.014842182
		 0.51334882 0.014842182 0.52491468;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface8" -p "group1";
	setAttr ".t" -type "double3" 0 6 0 ;
	setAttr ".s" -type "double3" 0.38453684507058195 0.38453684507058195 0.38453684507058195 ;
createNode mesh -n "polySurfaceShape8" -p "polySurface8";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.0078289975374014609 0.43785685300827026 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.0080674812 0.370251
		 0.0097384974 0.370251 0.0097384974 0.65995097 0.0080674775 0.65995097 0.002889093
		 0.2930069 0.0080674998 0.66162193 0.0063964832 0.66162193 0.0063964608 0.65995097
		 0.002889093 0.58270687 0.0047254451 0.65995097 0.0047254525 0.370251 0.0063964645
		 0.370251 0.0061579421 0.58437783 0.0078289881 0.58437783 0.0047254451 0.36857998
		 0.0063964613 0.36857998 0.0030544363 0.370251 0.0044869781 0.58270687 0.0061579794
		 0.58270687 0.0030544288 0.65995097 0.0095000193 0.2930069 0.0078290105 0.58270687
		 0.0095000193 0.58270687 0.007829003 0.2930069 0.0095731318 0.58270687 0.0079021156
		 0.58270663 0.0079021156 0.2930069 0.0095731318 0.2930069 0.0045602247 0.29133585
		 0.0062312335 0.29133597 0.0062311068 0.29300696 0.0045601055 0.2930069 0.011171035
		 0.2930069 0.011171035 0.58270687 0.0062310994 0.58270711 0.004560113 0.58270687 0.0062321275
		 0.58437842 0.0044869632 0.2930069 0.0061579868 0.29133588 0.0079031438 0.58437735
		 0.0061579868 0.2930069 0.007829003 0.29133588;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 2 3
		f 4 1 7 -3 -7
		mu 0 4 3 5 6 7
		f 4 2 9 -4 -9
		mu 0 4 7 9 10 11
		f 4 3 11 -1 -11
		mu 0 4 11 10 14 15
		f 4 -12 -10 -8 -6
		mu 0 4 16 10 9 19
		f 4 10 4 6 8
		mu 0 4 11 0 3 7
		f 4 12 17 -14 -17
		mu 0 4 24 25 26 27
		f 4 13 19 -15 -19
		mu 0 4 28 29 30 31
		f 4 14 21 -16 -21
		mu 0 4 31 30 34 35
		f 4 15 23 -13 -23
		mu 0 4 36 34 25 39
		f 4 -24 -22 -20 -18
		mu 0 4 25 34 30 26
		f 4 22 16 18 20
		mu 0 4 35 8 4 31
		f 4 24 29 -26 -29
		mu 0 4 20 32 33 22
		f 4 25 31 -27 -31
		mu 0 4 13 12 18 21
		f 4 26 33 -28 -33
		mu 0 4 21 18 40 23
		f 4 27 35 -25 -35
		mu 0 4 23 40 38 41
		f 4 -36 -34 -32 -30
		mu 0 4 37 40 18 17
		f 4 34 28 30 32
		mu 0 4 23 20 22 21;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape18" -p "polySurface8";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:17]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.375
		 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1
		 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".pt[0:23]" -type "float3"  -1.7508864e-007 -2.3615623 
		1.7136335e-007 1.7508864e-007 -2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		1.7136335e-007 1.7508864e-007 2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		-1.7136335e-007 1.7508864e-007 2.3615623 -1.7136335e-007 -1.7508864e-007 -2.3615623 
		-1.7136335e-007 1.7508864e-007 -2.3615623 -1.7136335e-007 -2.3615623 1.7136335e-007 
		1.7136335e-007 -2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		1.7136335e-007 2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		-1.7136335e-007 2.3615623 -1.7136335e-007 -1.7136335e-007 -2.3615623 1.7136335e-007 
		-1.7136335e-007 -2.3615623 -1.7136335e-007 -1.7136335e-007 1.7508864e-007 -1.7136335e-007 
		2.3615623 -1.7508864e-007 -1.7136335e-007 2.3615623 1.7508864e-007 -1.7136335e-007 
		-2.3615623 -1.7508864e-007 -1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		-2.3615623 -1.7508864e-007 1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		2.3615623 -1.7508864e-007 1.7136335e-007 2.3615623;
	setAttr -s 24 ".vt[0:23]"  -0.029999999 -2.83949995 0.029999999 0.029999999 -2.83949995 0.029999999
		 -0.029999999 2.83949995 0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999
		 0.029999999 2.83949995 -0.029999999 -0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 -0.029999999
		 -2.83949995 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 0.029999999
		 2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999 -0.029999999
		 -2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 0.029999999 -0.029999999 2.83949995
		 -0.029999999 -0.029999999 2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 -2.83949995
		 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 0.029999999 0.029999999 2.83949995
		 -0.029999999 0.029999999 2.83949995;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 0 9 11 0 10 12 0
		 11 13 0 12 14 0 13 15 0 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 0 17 19 0
		 18 20 0 19 21 0 20 22 0 21 23 0 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape19" -p "polySurface8";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.032190963625907898 0.53648048639297485 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.026408017
		 0.51334882 0.037973881 0.51334882 0.037973881 0.52491468 0.026408017 0.52491468 0.037973881
		 0.53648049 0.026408017 0.53648049 0.037973881 0.54804635 0.026408017 0.54804635 0.037973881
		 0.55961215 0.026408017 0.55961215 0.049539745 0.51334882 0.049539745 0.52491468 0.014842182
		 0.51334882 0.014842182 0.52491468;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface9" -p "group1";
	setAttr ".t" -type "double3" 6 5.9999999999999991 0 ;
	setAttr ".s" -type "double3" 0.38453684507058195 0.38453684507058195 0.38453684507058195 ;
createNode mesh -n "polySurfaceShape9" -p "polySurface9";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.0078289975374014609 0.43785685300827026 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.0080674812 0.370251
		 0.0097384974 0.370251 0.0097384974 0.65995097 0.0080674775 0.65995097 0.002889093
		 0.2930069 0.0080674998 0.66162193 0.0063964832 0.66162193 0.0063964608 0.65995097
		 0.002889093 0.58270687 0.0047254451 0.65995097 0.0047254525 0.370251 0.0063964645
		 0.370251 0.0061579421 0.58437783 0.0078289881 0.58437783 0.0047254451 0.36857998
		 0.0063964613 0.36857998 0.0030544363 0.370251 0.0044869781 0.58270687 0.0061579794
		 0.58270687 0.0030544288 0.65995097 0.0095000193 0.2930069 0.0078290105 0.58270687
		 0.0095000193 0.58270687 0.007829003 0.2930069 0.0095731318 0.58270687 0.0079021156
		 0.58270663 0.0079021156 0.2930069 0.0095731318 0.2930069 0.0045602247 0.29133585
		 0.0062312335 0.29133597 0.0062311068 0.29300696 0.0045601055 0.2930069 0.011171035
		 0.2930069 0.011171035 0.58270687 0.0062310994 0.58270711 0.004560113 0.58270687 0.0062321275
		 0.58437842 0.0044869632 0.2930069 0.0061579868 0.29133588 0.0079031438 0.58437735
		 0.0061579868 0.2930069 0.007829003 0.29133588;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 2 3
		f 4 1 7 -3 -7
		mu 0 4 3 5 6 7
		f 4 2 9 -4 -9
		mu 0 4 7 9 10 11
		f 4 3 11 -1 -11
		mu 0 4 11 10 14 15
		f 4 -12 -10 -8 -6
		mu 0 4 16 10 9 19
		f 4 10 4 6 8
		mu 0 4 11 0 3 7
		f 4 12 17 -14 -17
		mu 0 4 24 25 26 27
		f 4 13 19 -15 -19
		mu 0 4 28 29 30 31
		f 4 14 21 -16 -21
		mu 0 4 31 30 34 35
		f 4 15 23 -13 -23
		mu 0 4 36 34 25 39
		f 4 -24 -22 -20 -18
		mu 0 4 25 34 30 26
		f 4 22 16 18 20
		mu 0 4 35 8 4 31
		f 4 24 29 -26 -29
		mu 0 4 20 32 33 22
		f 4 25 31 -27 -31
		mu 0 4 13 12 18 21
		f 4 26 33 -28 -33
		mu 0 4 21 18 40 23
		f 4 27 35 -25 -35
		mu 0 4 23 40 38 41
		f 4 -36 -34 -32 -30
		mu 0 4 37 40 18 17
		f 4 34 28 30 32
		mu 0 4 23 20 22 21;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape20" -p "polySurface9";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:17]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.375
		 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1
		 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".pt[0:23]" -type "float3"  -1.7508864e-007 -2.3615623 
		1.7136335e-007 1.7508864e-007 -2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		1.7136335e-007 1.7508864e-007 2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		-1.7136335e-007 1.7508864e-007 2.3615623 -1.7136335e-007 -1.7508864e-007 -2.3615623 
		-1.7136335e-007 1.7508864e-007 -2.3615623 -1.7136335e-007 -2.3615623 1.7136335e-007 
		1.7136335e-007 -2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		1.7136335e-007 2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		-1.7136335e-007 2.3615623 -1.7136335e-007 -1.7136335e-007 -2.3615623 1.7136335e-007 
		-1.7136335e-007 -2.3615623 -1.7136335e-007 -1.7136335e-007 1.7508864e-007 -1.7136335e-007 
		2.3615623 -1.7508864e-007 -1.7136335e-007 2.3615623 1.7508864e-007 -1.7136335e-007 
		-2.3615623 -1.7508864e-007 -1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		-2.3615623 -1.7508864e-007 1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		2.3615623 -1.7508864e-007 1.7136335e-007 2.3615623;
	setAttr -s 24 ".vt[0:23]"  -0.029999999 -2.83949995 0.029999999 0.029999999 -2.83949995 0.029999999
		 -0.029999999 2.83949995 0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999
		 0.029999999 2.83949995 -0.029999999 -0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 -0.029999999
		 -2.83949995 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 0.029999999
		 2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999 -0.029999999
		 -2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 0.029999999 -0.029999999 2.83949995
		 -0.029999999 -0.029999999 2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 -2.83949995
		 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 0.029999999 0.029999999 2.83949995
		 -0.029999999 0.029999999 2.83949995;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 0 9 11 0 10 12 0
		 11 13 0 12 14 0 13 15 0 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 0 17 19 0
		 18 20 0 19 21 0 20 22 0 21 23 0 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape21" -p "polySurface9";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.032190963625907898 0.53648048639297485 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.026408017
		 0.51334882 0.037973881 0.51334882 0.037973881 0.52491468 0.026408017 0.52491468 0.037973881
		 0.53648049 0.026408017 0.53648049 0.037973881 0.54804635 0.026408017 0.54804635 0.037973881
		 0.55961215 0.026408017 0.55961215 0.049539745 0.51334882 0.049539745 0.52491468 0.014842182
		 0.51334882 0.014842182 0.52491468;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface10" -p "group1";
	setAttr ".t" -type "double3" -6 0 0 ;
	setAttr ".s" -type "double3" 0.38453684507058195 0.38453684507058195 0.38453684507058195 ;
createNode mesh -n "polySurfaceShape10" -p "polySurface10";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.0078289975374014609 0.43785685300827026 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.0080674812 0.370251
		 0.0097384974 0.370251 0.0097384974 0.65995097 0.0080674775 0.65995097 0.002889093
		 0.2930069 0.0080674998 0.66162193 0.0063964832 0.66162193 0.0063964608 0.65995097
		 0.002889093 0.58270687 0.0047254451 0.65995097 0.0047254525 0.370251 0.0063964645
		 0.370251 0.0061579421 0.58437783 0.0078289881 0.58437783 0.0047254451 0.36857998
		 0.0063964613 0.36857998 0.0030544363 0.370251 0.0044869781 0.58270687 0.0061579794
		 0.58270687 0.0030544288 0.65995097 0.0095000193 0.2930069 0.0078290105 0.58270687
		 0.0095000193 0.58270687 0.007829003 0.2930069 0.0095731318 0.58270687 0.0079021156
		 0.58270663 0.0079021156 0.2930069 0.0095731318 0.2930069 0.0045602247 0.29133585
		 0.0062312335 0.29133597 0.0062311068 0.29300696 0.0045601055 0.2930069 0.011171035
		 0.2930069 0.011171035 0.58270687 0.0062310994 0.58270711 0.004560113 0.58270687 0.0062321275
		 0.58437842 0.0044869632 0.2930069 0.0061579868 0.29133588 0.0079031438 0.58437735
		 0.0061579868 0.2930069 0.007829003 0.29133588;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 2 3
		f 4 1 7 -3 -7
		mu 0 4 3 5 6 7
		f 4 2 9 -4 -9
		mu 0 4 7 9 10 11
		f 4 3 11 -1 -11
		mu 0 4 11 10 14 15
		f 4 -12 -10 -8 -6
		mu 0 4 16 10 9 19
		f 4 10 4 6 8
		mu 0 4 11 0 3 7
		f 4 12 17 -14 -17
		mu 0 4 24 25 26 27
		f 4 13 19 -15 -19
		mu 0 4 28 29 30 31
		f 4 14 21 -16 -21
		mu 0 4 31 30 34 35
		f 4 15 23 -13 -23
		mu 0 4 36 34 25 39
		f 4 -24 -22 -20 -18
		mu 0 4 25 34 30 26
		f 4 22 16 18 20
		mu 0 4 35 8 4 31
		f 4 24 29 -26 -29
		mu 0 4 20 32 33 22
		f 4 25 31 -27 -31
		mu 0 4 13 12 18 21
		f 4 26 33 -28 -33
		mu 0 4 21 18 40 23
		f 4 27 35 -25 -35
		mu 0 4 23 40 38 41
		f 4 -36 -34 -32 -30
		mu 0 4 37 40 18 17
		f 4 34 28 30 32
		mu 0 4 23 20 22 21;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape22" -p "polySurface10";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:17]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.375
		 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1
		 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".pt[0:23]" -type "float3"  -1.7508864e-007 -2.3615623 
		1.7136335e-007 1.7508864e-007 -2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		1.7136335e-007 1.7508864e-007 2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		-1.7136335e-007 1.7508864e-007 2.3615623 -1.7136335e-007 -1.7508864e-007 -2.3615623 
		-1.7136335e-007 1.7508864e-007 -2.3615623 -1.7136335e-007 -2.3615623 1.7136335e-007 
		1.7136335e-007 -2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		1.7136335e-007 2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		-1.7136335e-007 2.3615623 -1.7136335e-007 -1.7136335e-007 -2.3615623 1.7136335e-007 
		-1.7136335e-007 -2.3615623 -1.7136335e-007 -1.7136335e-007 1.7508864e-007 -1.7136335e-007 
		2.3615623 -1.7508864e-007 -1.7136335e-007 2.3615623 1.7508864e-007 -1.7136335e-007 
		-2.3615623 -1.7508864e-007 -1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		-2.3615623 -1.7508864e-007 1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		2.3615623 -1.7508864e-007 1.7136335e-007 2.3615623;
	setAttr -s 24 ".vt[0:23]"  -0.029999999 -2.83949995 0.029999999 0.029999999 -2.83949995 0.029999999
		 -0.029999999 2.83949995 0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999
		 0.029999999 2.83949995 -0.029999999 -0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 -0.029999999
		 -2.83949995 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 0.029999999
		 2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999 -0.029999999
		 -2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 0.029999999 -0.029999999 2.83949995
		 -0.029999999 -0.029999999 2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 -2.83949995
		 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 0.029999999 0.029999999 2.83949995
		 -0.029999999 0.029999999 2.83949995;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 0 9 11 0 10 12 0
		 11 13 0 12 14 0 13 15 0 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 0 17 19 0
		 18 20 0 19 21 0 20 22 0 21 23 0 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape23" -p "polySurface10";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.032190963625907898 0.53648048639297485 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.026408017
		 0.51334882 0.037973881 0.51334882 0.037973881 0.52491468 0.026408017 0.52491468 0.037973881
		 0.53648049 0.026408017 0.53648049 0.037973881 0.54804635 0.026408017 0.54804635 0.037973881
		 0.55961215 0.026408017 0.55961215 0.049539745 0.51334882 0.049539745 0.52491468 0.014842182
		 0.51334882 0.014842182 0.52491468;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface12" -p "group1";
	setAttr ".t" -type "double3" 6 0 0 ;
	setAttr ".s" -type "double3" 0.38453684507058195 0.38453684507058195 0.38453684507058195 ;
createNode mesh -n "polySurfaceShape12" -p "polySurface12";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.0078289975374014609 0.43785685300827026 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.0080674812 0.370251
		 0.0097384974 0.370251 0.0097384974 0.65995097 0.0080674775 0.65995097 0.002889093
		 0.2930069 0.0080674998 0.66162193 0.0063964832 0.66162193 0.0063964608 0.65995097
		 0.002889093 0.58270687 0.0047254451 0.65995097 0.0047254525 0.370251 0.0063964645
		 0.370251 0.0061579421 0.58437783 0.0078289881 0.58437783 0.0047254451 0.36857998
		 0.0063964613 0.36857998 0.0030544363 0.370251 0.0044869781 0.58270687 0.0061579794
		 0.58270687 0.0030544288 0.65995097 0.0095000193 0.2930069 0.0078290105 0.58270687
		 0.0095000193 0.58270687 0.007829003 0.2930069 0.0095731318 0.58270687 0.0079021156
		 0.58270663 0.0079021156 0.2930069 0.0095731318 0.2930069 0.0045602247 0.29133585
		 0.0062312335 0.29133597 0.0062311068 0.29300696 0.0045601055 0.2930069 0.011171035
		 0.2930069 0.011171035 0.58270687 0.0062310994 0.58270711 0.004560113 0.58270687 0.0062321275
		 0.58437842 0.0044869632 0.2930069 0.0061579868 0.29133588 0.0079031438 0.58437735
		 0.0061579868 0.2930069 0.007829003 0.29133588;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 2 3
		f 4 1 7 -3 -7
		mu 0 4 3 5 6 7
		f 4 2 9 -4 -9
		mu 0 4 7 9 10 11
		f 4 3 11 -1 -11
		mu 0 4 11 10 14 15
		f 4 -12 -10 -8 -6
		mu 0 4 16 10 9 19
		f 4 10 4 6 8
		mu 0 4 11 0 3 7
		f 4 12 17 -14 -17
		mu 0 4 24 25 26 27
		f 4 13 19 -15 -19
		mu 0 4 28 29 30 31
		f 4 14 21 -16 -21
		mu 0 4 31 30 34 35
		f 4 15 23 -13 -23
		mu 0 4 36 34 25 39
		f 4 -24 -22 -20 -18
		mu 0 4 25 34 30 26
		f 4 22 16 18 20
		mu 0 4 35 8 4 31
		f 4 24 29 -26 -29
		mu 0 4 20 32 33 22
		f 4 25 31 -27 -31
		mu 0 4 13 12 18 21
		f 4 26 33 -28 -33
		mu 0 4 21 18 40 23
		f 4 27 35 -25 -35
		mu 0 4 23 40 38 41
		f 4 -36 -34 -32 -30
		mu 0 4 37 40 18 17
		f 4 34 28 30 32
		mu 0 4 23 20 22 21;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape26" -p "polySurface12";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:17]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.375
		 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1
		 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".pt[0:23]" -type "float3"  -1.7508864e-007 -2.3615623 
		1.7136335e-007 1.7508864e-007 -2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		1.7136335e-007 1.7508864e-007 2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		-1.7136335e-007 1.7508864e-007 2.3615623 -1.7136335e-007 -1.7508864e-007 -2.3615623 
		-1.7136335e-007 1.7508864e-007 -2.3615623 -1.7136335e-007 -2.3615623 1.7136335e-007 
		1.7136335e-007 -2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		1.7136335e-007 2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		-1.7136335e-007 2.3615623 -1.7136335e-007 -1.7136335e-007 -2.3615623 1.7136335e-007 
		-1.7136335e-007 -2.3615623 -1.7136335e-007 -1.7136335e-007 1.7508864e-007 -1.7136335e-007 
		2.3615623 -1.7508864e-007 -1.7136335e-007 2.3615623 1.7508864e-007 -1.7136335e-007 
		-2.3615623 -1.7508864e-007 -1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		-2.3615623 -1.7508864e-007 1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		2.3615623 -1.7508864e-007 1.7136335e-007 2.3615623;
	setAttr -s 24 ".vt[0:23]"  -0.029999999 -2.83949995 0.029999999 0.029999999 -2.83949995 0.029999999
		 -0.029999999 2.83949995 0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999
		 0.029999999 2.83949995 -0.029999999 -0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 -0.029999999
		 -2.83949995 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 0.029999999
		 2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999 -0.029999999
		 -2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 0.029999999 -0.029999999 2.83949995
		 -0.029999999 -0.029999999 2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 -2.83949995
		 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 0.029999999 0.029999999 2.83949995
		 -0.029999999 0.029999999 2.83949995;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 0 9 11 0 10 12 0
		 11 13 0 12 14 0 13 15 0 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 0 17 19 0
		 18 20 0 19 21 0 20 22 0 21 23 0 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape27" -p "polySurface12";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.032190963625907898 0.53648048639297485 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.026408017
		 0.51334882 0.037973881 0.51334882 0.037973881 0.52491468 0.026408017 0.52491468 0.037973881
		 0.53648049 0.026408017 0.53648049 0.037973881 0.54804635 0.026408017 0.54804635 0.037973881
		 0.55961215 0.026408017 0.55961215 0.049539745 0.51334882 0.049539745 0.52491468 0.014842182
		 0.51334882 0.014842182 0.52491468;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface13" -p "group1";
	setAttr ".t" -type "double3" -5.9999999999999991 -6 0 ;
	setAttr ".s" -type "double3" 0.38453684507058195 0.38453684507058195 0.38453684507058195 ;
createNode mesh -n "polySurfaceShape13" -p "polySurface13";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.0078289975374014609 0.43785685300827026 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.0080674812 0.370251
		 0.0097384974 0.370251 0.0097384974 0.65995097 0.0080674775 0.65995097 0.002889093
		 0.2930069 0.0080674998 0.66162193 0.0063964832 0.66162193 0.0063964608 0.65995097
		 0.002889093 0.58270687 0.0047254451 0.65995097 0.0047254525 0.370251 0.0063964645
		 0.370251 0.0061579421 0.58437783 0.0078289881 0.58437783 0.0047254451 0.36857998
		 0.0063964613 0.36857998 0.0030544363 0.370251 0.0044869781 0.58270687 0.0061579794
		 0.58270687 0.0030544288 0.65995097 0.0095000193 0.2930069 0.0078290105 0.58270687
		 0.0095000193 0.58270687 0.007829003 0.2930069 0.0095731318 0.58270687 0.0079021156
		 0.58270663 0.0079021156 0.2930069 0.0095731318 0.2930069 0.0045602247 0.29133585
		 0.0062312335 0.29133597 0.0062311068 0.29300696 0.0045601055 0.2930069 0.011171035
		 0.2930069 0.011171035 0.58270687 0.0062310994 0.58270711 0.004560113 0.58270687 0.0062321275
		 0.58437842 0.0044869632 0.2930069 0.0061579868 0.29133588 0.0079031438 0.58437735
		 0.0061579868 0.2930069 0.007829003 0.29133588;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 2 3
		f 4 1 7 -3 -7
		mu 0 4 3 5 6 7
		f 4 2 9 -4 -9
		mu 0 4 7 9 10 11
		f 4 3 11 -1 -11
		mu 0 4 11 10 14 15
		f 4 -12 -10 -8 -6
		mu 0 4 16 10 9 19
		f 4 10 4 6 8
		mu 0 4 11 0 3 7
		f 4 12 17 -14 -17
		mu 0 4 24 25 26 27
		f 4 13 19 -15 -19
		mu 0 4 28 29 30 31
		f 4 14 21 -16 -21
		mu 0 4 31 30 34 35
		f 4 15 23 -13 -23
		mu 0 4 36 34 25 39
		f 4 -24 -22 -20 -18
		mu 0 4 25 34 30 26
		f 4 22 16 18 20
		mu 0 4 35 8 4 31
		f 4 24 29 -26 -29
		mu 0 4 20 32 33 22
		f 4 25 31 -27 -31
		mu 0 4 13 12 18 21
		f 4 26 33 -28 -33
		mu 0 4 21 18 40 23
		f 4 27 35 -25 -35
		mu 0 4 23 40 38 41
		f 4 -36 -34 -32 -30
		mu 0 4 37 40 18 17
		f 4 34 28 30 32
		mu 0 4 23 20 22 21;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape28" -p "polySurface13";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:17]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.375
		 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1
		 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".pt[0:23]" -type "float3"  -1.7508864e-007 -2.3615623 
		1.7136335e-007 1.7508864e-007 -2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		1.7136335e-007 1.7508864e-007 2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		-1.7136335e-007 1.7508864e-007 2.3615623 -1.7136335e-007 -1.7508864e-007 -2.3615623 
		-1.7136335e-007 1.7508864e-007 -2.3615623 -1.7136335e-007 -2.3615623 1.7136335e-007 
		1.7136335e-007 -2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		1.7136335e-007 2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		-1.7136335e-007 2.3615623 -1.7136335e-007 -1.7136335e-007 -2.3615623 1.7136335e-007 
		-1.7136335e-007 -2.3615623 -1.7136335e-007 -1.7136335e-007 1.7508864e-007 -1.7136335e-007 
		2.3615623 -1.7508864e-007 -1.7136335e-007 2.3615623 1.7508864e-007 -1.7136335e-007 
		-2.3615623 -1.7508864e-007 -1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		-2.3615623 -1.7508864e-007 1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		2.3615623 -1.7508864e-007 1.7136335e-007 2.3615623;
	setAttr -s 24 ".vt[0:23]"  -0.029999999 -2.83949995 0.029999999 0.029999999 -2.83949995 0.029999999
		 -0.029999999 2.83949995 0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999
		 0.029999999 2.83949995 -0.029999999 -0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 -0.029999999
		 -2.83949995 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 0.029999999
		 2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999 -0.029999999
		 -2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 0.029999999 -0.029999999 2.83949995
		 -0.029999999 -0.029999999 2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 -2.83949995
		 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 0.029999999 0.029999999 2.83949995
		 -0.029999999 0.029999999 2.83949995;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 0 9 11 0 10 12 0
		 11 13 0 12 14 0 13 15 0 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 0 17 19 0
		 18 20 0 19 21 0 20 22 0 21 23 0 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape29" -p "polySurface13";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.032190963625907898 0.53648048639297485 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.026408017
		 0.51334882 0.037973881 0.51334882 0.037973881 0.52491468 0.026408017 0.52491468 0.037973881
		 0.53648049 0.026408017 0.53648049 0.037973881 0.54804635 0.026408017 0.54804635 0.037973881
		 0.55961215 0.026408017 0.55961215 0.049539745 0.51334882 0.049539745 0.52491468 0.014842182
		 0.51334882 0.014842182 0.52491468;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface14" -p "group1";
	setAttr ".t" -type "double3" 0 -6 0 ;
	setAttr ".s" -type "double3" 0.38453684507058195 0.38453684507058195 0.38453684507058195 ;
createNode mesh -n "polySurfaceShape14" -p "polySurface14";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.0078289975374014609 0.43785685300827026 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.0080674812 0.370251
		 0.0097384974 0.370251 0.0097384974 0.65995097 0.0080674775 0.65995097 0.002889093
		 0.2930069 0.0080674998 0.66162193 0.0063964832 0.66162193 0.0063964608 0.65995097
		 0.002889093 0.58270687 0.0047254451 0.65995097 0.0047254525 0.370251 0.0063964645
		 0.370251 0.0061579421 0.58437783 0.0078289881 0.58437783 0.0047254451 0.36857998
		 0.0063964613 0.36857998 0.0030544363 0.370251 0.0044869781 0.58270687 0.0061579794
		 0.58270687 0.0030544288 0.65995097 0.0095000193 0.2930069 0.0078290105 0.58270687
		 0.0095000193 0.58270687 0.007829003 0.2930069 0.0095731318 0.58270687 0.0079021156
		 0.58270663 0.0079021156 0.2930069 0.0095731318 0.2930069 0.0045602247 0.29133585
		 0.0062312335 0.29133597 0.0062311068 0.29300696 0.0045601055 0.2930069 0.011171035
		 0.2930069 0.011171035 0.58270687 0.0062310994 0.58270711 0.004560113 0.58270687 0.0062321275
		 0.58437842 0.0044869632 0.2930069 0.0061579868 0.29133588 0.0079031438 0.58437735
		 0.0061579868 0.2930069 0.007829003 0.29133588;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 2 3
		f 4 1 7 -3 -7
		mu 0 4 3 5 6 7
		f 4 2 9 -4 -9
		mu 0 4 7 9 10 11
		f 4 3 11 -1 -11
		mu 0 4 11 10 14 15
		f 4 -12 -10 -8 -6
		mu 0 4 16 10 9 19
		f 4 10 4 6 8
		mu 0 4 11 0 3 7
		f 4 12 17 -14 -17
		mu 0 4 24 25 26 27
		f 4 13 19 -15 -19
		mu 0 4 28 29 30 31
		f 4 14 21 -16 -21
		mu 0 4 31 30 34 35
		f 4 15 23 -13 -23
		mu 0 4 36 34 25 39
		f 4 -24 -22 -20 -18
		mu 0 4 25 34 30 26
		f 4 22 16 18 20
		mu 0 4 35 8 4 31
		f 4 24 29 -26 -29
		mu 0 4 20 32 33 22
		f 4 25 31 -27 -31
		mu 0 4 13 12 18 21
		f 4 26 33 -28 -33
		mu 0 4 21 18 40 23
		f 4 27 35 -25 -35
		mu 0 4 23 40 38 41
		f 4 -36 -34 -32 -30
		mu 0 4 37 40 18 17
		f 4 34 28 30 32
		mu 0 4 23 20 22 21;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape30" -p "polySurface14";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:17]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.375
		 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1
		 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".pt[0:23]" -type "float3"  -1.7508864e-007 -2.3615623 
		1.7136335e-007 1.7508864e-007 -2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		1.7136335e-007 1.7508864e-007 2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		-1.7136335e-007 1.7508864e-007 2.3615623 -1.7136335e-007 -1.7508864e-007 -2.3615623 
		-1.7136335e-007 1.7508864e-007 -2.3615623 -1.7136335e-007 -2.3615623 1.7136335e-007 
		1.7136335e-007 -2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		1.7136335e-007 2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		-1.7136335e-007 2.3615623 -1.7136335e-007 -1.7136335e-007 -2.3615623 1.7136335e-007 
		-1.7136335e-007 -2.3615623 -1.7136335e-007 -1.7136335e-007 1.7508864e-007 -1.7136335e-007 
		2.3615623 -1.7508864e-007 -1.7136335e-007 2.3615623 1.7508864e-007 -1.7136335e-007 
		-2.3615623 -1.7508864e-007 -1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		-2.3615623 -1.7508864e-007 1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		2.3615623 -1.7508864e-007 1.7136335e-007 2.3615623;
	setAttr -s 24 ".vt[0:23]"  -0.029999999 -2.83949995 0.029999999 0.029999999 -2.83949995 0.029999999
		 -0.029999999 2.83949995 0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999
		 0.029999999 2.83949995 -0.029999999 -0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 -0.029999999
		 -2.83949995 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 0.029999999
		 2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999 -0.029999999
		 -2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 0.029999999 -0.029999999 2.83949995
		 -0.029999999 -0.029999999 2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 -2.83949995
		 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 0.029999999 0.029999999 2.83949995
		 -0.029999999 0.029999999 2.83949995;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 0 9 11 0 10 12 0
		 11 13 0 12 14 0 13 15 0 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 0 17 19 0
		 18 20 0 19 21 0 20 22 0 21 23 0 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape31" -p "polySurface14";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.032190963625907898 0.53648048639297485 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.026408017
		 0.51334882 0.037973881 0.51334882 0.037973881 0.52491468 0.026408017 0.52491468 0.037973881
		 0.53648049 0.026408017 0.53648049 0.037973881 0.54804635 0.026408017 0.54804635 0.037973881
		 0.55961215 0.026408017 0.55961215 0.049539745 0.51334882 0.049539745 0.52491468 0.014842182
		 0.51334882 0.014842182 0.52491468;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "polySurface15" -p "group1";
	setAttr ".t" -type "double3" 5.9999999999999991 -6 0 ;
	setAttr ".s" -type "double3" 0.38453684507058195 0.38453684507058195 0.38453684507058195 ;
createNode mesh -n "polySurfaceShape15" -p "polySurface15";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.0078289975374014609 0.43785685300827026 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.0080674812 0.370251
		 0.0097384974 0.370251 0.0097384974 0.65995097 0.0080674775 0.65995097 0.002889093
		 0.2930069 0.0080674998 0.66162193 0.0063964832 0.66162193 0.0063964608 0.65995097
		 0.002889093 0.58270687 0.0047254451 0.65995097 0.0047254525 0.370251 0.0063964645
		 0.370251 0.0061579421 0.58437783 0.0078289881 0.58437783 0.0047254451 0.36857998
		 0.0063964613 0.36857998 0.0030544363 0.370251 0.0044869781 0.58270687 0.0061579794
		 0.58270687 0.0030544288 0.65995097 0.0095000193 0.2930069 0.0078290105 0.58270687
		 0.0095000193 0.58270687 0.007829003 0.2930069 0.0095731318 0.58270687 0.0079021156
		 0.58270663 0.0079021156 0.2930069 0.0095731318 0.2930069 0.0045602247 0.29133585
		 0.0062312335 0.29133597 0.0062311068 0.29300696 0.0045601055 0.2930069 0.011171035
		 0.2930069 0.011171035 0.58270687 0.0062310994 0.58270711 0.004560113 0.58270687 0.0062321275
		 0.58437842 0.0044869632 0.2930069 0.0061579868 0.29133588 0.0079031438 0.58437735
		 0.0061579868 0.2930069 0.007829003 0.29133588;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 2 3
		f 4 1 7 -3 -7
		mu 0 4 3 5 6 7
		f 4 2 9 -4 -9
		mu 0 4 7 9 10 11
		f 4 3 11 -1 -11
		mu 0 4 11 10 14 15
		f 4 -12 -10 -8 -6
		mu 0 4 16 10 9 19
		f 4 10 4 6 8
		mu 0 4 11 0 3 7
		f 4 12 17 -14 -17
		mu 0 4 24 25 26 27
		f 4 13 19 -15 -19
		mu 0 4 28 29 30 31
		f 4 14 21 -16 -21
		mu 0 4 31 30 34 35
		f 4 15 23 -13 -23
		mu 0 4 36 34 25 39
		f 4 -24 -22 -20 -18
		mu 0 4 25 34 30 26
		f 4 22 16 18 20
		mu 0 4 35 8 4 31
		f 4 24 29 -26 -29
		mu 0 4 20 32 33 22
		f 4 25 31 -27 -31
		mu 0 4 13 12 18 21
		f 4 26 33 -28 -33
		mu 0 4 21 18 40 23
		f 4 27 35 -25 -35
		mu 0 4 23 40 38 41
		f 4 -36 -34 -32 -30
		mu 0 4 37 40 18 17
		f 4 34 28 30 32
		mu 0 4 23 20 22 21;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape32" -p "polySurface15";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:17]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.375
		 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375 0.5 0.625 0.75 0.375 0.75 0.625 1
		 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".pt[0:23]" -type "float3"  -1.7508864e-007 -2.3615623 
		1.7136335e-007 1.7508864e-007 -2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		1.7136335e-007 1.7508864e-007 2.3615623 1.7136335e-007 -1.7508864e-007 2.3615623 
		-1.7136335e-007 1.7508864e-007 2.3615623 -1.7136335e-007 -1.7508864e-007 -2.3615623 
		-1.7136335e-007 1.7508864e-007 -2.3615623 -1.7136335e-007 -2.3615623 1.7136335e-007 
		1.7136335e-007 -2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		1.7136335e-007 2.3615623 -1.7136335e-007 1.7136335e-007 2.3615623 1.7136335e-007 
		-1.7136335e-007 2.3615623 -1.7136335e-007 -1.7136335e-007 -2.3615623 1.7136335e-007 
		-1.7136335e-007 -2.3615623 -1.7136335e-007 -1.7136335e-007 1.7508864e-007 -1.7136335e-007 
		2.3615623 -1.7508864e-007 -1.7136335e-007 2.3615623 1.7508864e-007 -1.7136335e-007 
		-2.3615623 -1.7508864e-007 -1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		-2.3615623 -1.7508864e-007 1.7136335e-007 -2.3615623 1.7508864e-007 1.7136335e-007 
		2.3615623 -1.7508864e-007 1.7136335e-007 2.3615623;
	setAttr -s 24 ".vt[0:23]"  -0.029999999 -2.83949995 0.029999999 0.029999999 -2.83949995 0.029999999
		 -0.029999999 2.83949995 0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999
		 0.029999999 2.83949995 -0.029999999 -0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 -0.029999999
		 -2.83949995 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 0.029999999
		 2.83949995 -0.029999999 0.029999999 2.83949995 0.029999999 -0.029999999 2.83949995 -0.029999999 -0.029999999
		 -2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 0.029999999 -0.029999999 2.83949995
		 -0.029999999 -0.029999999 2.83949995 0.029999999 -0.029999999 -2.83949995 -0.029999999 -0.029999999 -2.83949995
		 0.029999999 0.029999999 -2.83949995 -0.029999999 0.029999999 -2.83949995 0.029999999 0.029999999 2.83949995
		 -0.029999999 0.029999999 2.83949995;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 0 9 11 0 10 12 0
		 11 13 0 12 14 0 13 15 0 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 0 17 19 0
		 18 20 0 19 21 0 20 22 0 21 23 0 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "polySurfaceShape33" -p "polySurface15";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.032190963625907898 0.53648048639297485 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 42 ".uvst[0].uvsp[0:41]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.375 0 0.625 0 0.625 0.25 0.375 0.25 0.625 0.5 0.375
		 0.5 0.625 0.75 0.375 0.75 0.625 1 0.375 1 0.875 0 0.875 0.25 0.125 0 0.125 0.25 0.026408017
		 0.51334882 0.037973881 0.51334882 0.037973881 0.52491468 0.026408017 0.52491468 0.037973881
		 0.53648049 0.026408017 0.53648049 0.037973881 0.54804635 0.026408017 0.54804635 0.037973881
		 0.55961215 0.026408017 0.55961215 0.049539745 0.51334882 0.049539745 0.52491468 0.014842182
		 0.51334882 0.014842182 0.52491468;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 24 ".vt[0:23]"  -0.030000174 -5.2010622 0.030000171 0.030000174 -5.2010622 0.030000171
		 -0.030000174 5.2010622 0.030000171 0.030000174 5.2010622 0.030000171 -0.030000174 5.2010622 -0.030000171
		 0.030000174 5.2010622 -0.030000171 -0.030000174 -5.2010622 -0.030000171 0.030000174 -5.2010622 -0.030000171
		 -5.2010622 0.030000171 0.030000171 -5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 0.030000171
		 5.2010622 -0.030000171 0.030000171 5.2010622 0.030000171 -0.030000171 5.2010622 -0.030000171 -0.030000171
		 -5.2010622 0.030000171 -0.030000171 -5.2010622 -0.030000171 -0.030000171 0.030000174 -0.030000171 5.2010622
		 -0.030000174 -0.030000171 5.2010622 0.030000174 -0.030000171 -5.2010622 -0.030000174 -0.030000171 -5.2010622
		 0.030000174 0.030000171 -5.2010622 -0.030000174 0.030000171 -5.2010622 0.030000174 0.030000171 5.2010622
		 -0.030000174 0.030000171 5.2010622;
	setAttr -s 36 ".ed[0:35]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 1 1 3 1 2 4 0
		 3 5 0 4 6 1 5 7 1 6 0 0 7 1 0 8 9 0 10 11 0 12 13 0 14 15 0 8 10 1 9 11 1 10 12 0
		 11 13 0 12 14 1 13 15 1 14 8 0 15 9 0 16 17 0 18 19 0 20 21 0 22 23 0 16 18 1 17 19 1
		 18 20 0 19 21 0 20 22 1 21 23 1 22 16 0 23 17 0;
	setAttr -s 18 -ch 72 ".fc[0:17]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13
		f 4 12 17 -14 -17
		mu 0 4 14 15 16 17
		f 4 13 19 -15 -19
		mu 0 4 17 16 18 19
		f 4 14 21 -16 -21
		mu 0 4 19 18 20 21
		f 4 15 23 -13 -23
		mu 0 4 21 20 22 23
		f 4 -24 -22 -20 -18
		mu 0 4 15 24 25 16
		f 4 22 16 18 20
		mu 0 4 26 14 17 27
		f 4 24 29 -26 -29
		mu 0 4 28 29 30 31
		f 4 25 31 -27 -31
		mu 0 4 31 30 32 33
		f 4 26 33 -28 -33
		mu 0 4 33 32 34 35
		f 4 27 35 -25 -35
		mu 0 4 35 34 36 37
		f 4 -36 -34 -32 -30
		mu 0 4 29 38 39 30
		f 4 34 28 30 32
		mu 0 4 40 28 31 41;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mentalrayItemsList -s -n "mentalrayItemsList";
createNode mentalrayGlobals -s -n "mentalrayGlobals";
createNode mentalrayOptions -s -n "miDefaultOptions";
	addAttr -ci true -m -sn "stringOptions" -ln "stringOptions" -at "compound" -nc 
		3;
	addAttr -ci true -sn "name" -ln "name" -dt "string" -p "stringOptions";
	addAttr -ci true -sn "value" -ln "value" -dt "string" -p "stringOptions";
	addAttr -ci true -sn "type" -ln "type" -dt "string" -p "stringOptions";
	addAttr -ci true -sn "miSamplesQualityR" -ln "miSamplesQualityR" -dv 0.25 -min 0.01 
		-max 9999999.9000000004 -smn 0.1 -smx 2 -at "double";
	addAttr -ci true -sn "miSamplesQualityG" -ln "miSamplesQualityG" -dv 0.25 -min 0.01 
		-max 9999999.9000000004 -smn 0.1 -smx 2 -at "double";
	addAttr -ci true -sn "miSamplesQualityB" -ln "miSamplesQualityB" -dv 0.25 -min 0.01 
		-max 9999999.9000000004 -smn 0.1 -smx 2 -at "double";
	addAttr -ci true -sn "miSamplesQualityA" -ln "miSamplesQualityA" -dv 0.25 -min 0.01 
		-max 9999999.9000000004 -smn 0.1 -smx 2 -at "double";
	addAttr -ci true -sn "miSamplesMin" -ln "miSamplesMin" -dv 1 -min 0.1 -at "double";
	addAttr -ci true -sn "miSamplesMax" -ln "miSamplesMax" -dv 100 -min 0.1 -at "double";
	addAttr -ci true -sn "miSamplesErrorCutoffR" -ln "miSamplesErrorCutoffR" -min 0 
		-max 1 -at "double";
	addAttr -ci true -sn "miSamplesErrorCutoffG" -ln "miSamplesErrorCutoffG" -min 0 
		-max 1 -at "double";
	addAttr -ci true -sn "miSamplesErrorCutoffB" -ln "miSamplesErrorCutoffB" -min 0 
		-max 1 -at "double";
	addAttr -ci true -sn "miSamplesErrorCutoffA" -ln "miSamplesErrorCutoffA" -min 0 
		-max 1 -at "double";
	addAttr -ci true -sn "miSamplesPerObject" -ln "miSamplesPerObject" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -sn "miRastShadingSamples" -ln "miRastShadingSamples" -dv 1 -min 
		0.25 -at "double";
	addAttr -ci true -sn "miRastSamples" -ln "miRastSamples" -dv 3 -min 1 -at "long";
	addAttr -ci true -sn "miContrastAsColor" -ln "miContrastAsColor" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "miProgMaxTime" -ln "miProgMaxTime" -min 0 -at "long";
	addAttr -ci true -sn "miProgSubsampleSize" -ln "miProgSubsampleSize" -dv 4 -min 
		1 -at "long";
	addAttr -ci true -sn "miTraceCameraMotionVectors" -ln "miTraceCameraMotionVectors" 
		-min 0 -max 1 -at "bool";
	addAttr -ci true -sn "miTraceCameraClip" -ln "miTraceCameraClip" -min 0 -max 1 -at "bool";
	setAttr -s 45 ".stringOptions";
	setAttr ".stringOptions[0].name" -type "string" "rast motion factor";
	setAttr ".stringOptions[0].value" -type "string" "1.0";
	setAttr ".stringOptions[0].type" -type "string" "scalar";
	setAttr ".stringOptions[1].name" -type "string" "rast transparency depth";
	setAttr ".stringOptions[1].value" -type "string" "8";
	setAttr ".stringOptions[1].type" -type "string" "integer";
	setAttr ".stringOptions[2].name" -type "string" "rast useopacity";
	setAttr ".stringOptions[2].value" -type "string" "true";
	setAttr ".stringOptions[2].type" -type "string" "boolean";
	setAttr ".stringOptions[3].name" -type "string" "importon";
	setAttr ".stringOptions[3].value" -type "string" "false";
	setAttr ".stringOptions[3].type" -type "string" "boolean";
	setAttr ".stringOptions[4].name" -type "string" "importon density";
	setAttr ".stringOptions[4].value" -type "string" "1.0";
	setAttr ".stringOptions[4].type" -type "string" "scalar";
	setAttr ".stringOptions[5].name" -type "string" "importon merge";
	setAttr ".stringOptions[5].value" -type "string" "0.0";
	setAttr ".stringOptions[5].type" -type "string" "scalar";
	setAttr ".stringOptions[6].name" -type "string" "importon trace depth";
	setAttr ".stringOptions[6].value" -type "string" "0";
	setAttr ".stringOptions[6].type" -type "string" "integer";
	setAttr ".stringOptions[7].name" -type "string" "importon traverse";
	setAttr ".stringOptions[7].value" -type "string" "true";
	setAttr ".stringOptions[7].type" -type "string" "boolean";
	setAttr ".stringOptions[8].name" -type "string" "shadowmap pixel samples";
	setAttr ".stringOptions[8].value" -type "string" "3";
	setAttr ".stringOptions[8].type" -type "string" "integer";
	setAttr ".stringOptions[9].name" -type "string" "ambient occlusion";
	setAttr ".stringOptions[9].value" -type "string" "false";
	setAttr ".stringOptions[9].type" -type "string" "boolean";
	setAttr ".stringOptions[10].name" -type "string" "ambient occlusion rays";
	setAttr ".stringOptions[10].value" -type "string" "256";
	setAttr ".stringOptions[10].type" -type "string" "integer";
	setAttr ".stringOptions[11].name" -type "string" "ambient occlusion cache";
	setAttr ".stringOptions[11].value" -type "string" "false";
	setAttr ".stringOptions[11].type" -type "string" "boolean";
	setAttr ".stringOptions[12].name" -type "string" "ambient occlusion cache density";
	setAttr ".stringOptions[12].value" -type "string" "1.0";
	setAttr ".stringOptions[12].type" -type "string" "scalar";
	setAttr ".stringOptions[13].name" -type "string" "ambient occlusion cache points";
	setAttr ".stringOptions[13].value" -type "string" "64";
	setAttr ".stringOptions[13].type" -type "string" "integer";
	setAttr ".stringOptions[14].name" -type "string" "irradiance particles";
	setAttr ".stringOptions[14].value" -type "string" "false";
	setAttr ".stringOptions[14].type" -type "string" "boolean";
	setAttr ".stringOptions[15].name" -type "string" "irradiance particles rays";
	setAttr ".stringOptions[15].value" -type "string" "256";
	setAttr ".stringOptions[15].type" -type "string" "integer";
	setAttr ".stringOptions[16].name" -type "string" "irradiance particles interpolate";
	setAttr ".stringOptions[16].value" -type "string" "1";
	setAttr ".stringOptions[16].type" -type "string" "integer";
	setAttr ".stringOptions[17].name" -type "string" "irradiance particles interppoints";
	setAttr ".stringOptions[17].value" -type "string" "64";
	setAttr ".stringOptions[17].type" -type "string" "integer";
	setAttr ".stringOptions[18].name" -type "string" "irradiance particles indirect passes";
	setAttr ".stringOptions[18].value" -type "string" "0";
	setAttr ".stringOptions[18].type" -type "string" "integer";
	setAttr ".stringOptions[19].name" -type "string" "irradiance particles scale";
	setAttr ".stringOptions[19].value" -type "string" "1.0";
	setAttr ".stringOptions[19].type" -type "string" "scalar";
	setAttr ".stringOptions[20].name" -type "string" "irradiance particles env";
	setAttr ".stringOptions[20].value" -type "string" "true";
	setAttr ".stringOptions[20].type" -type "string" "boolean";
	setAttr ".stringOptions[21].name" -type "string" "irradiance particles env rays";
	setAttr ".stringOptions[21].value" -type "string" "256";
	setAttr ".stringOptions[21].type" -type "string" "integer";
	setAttr ".stringOptions[22].name" -type "string" "irradiance particles env scale";
	setAttr ".stringOptions[22].value" -type "string" "1";
	setAttr ".stringOptions[22].type" -type "string" "integer";
	setAttr ".stringOptions[23].name" -type "string" "irradiance particles rebuild";
	setAttr ".stringOptions[23].value" -type "string" "true";
	setAttr ".stringOptions[23].type" -type "string" "boolean";
	setAttr ".stringOptions[24].name" -type "string" "irradiance particles file";
	setAttr ".stringOptions[24].value" -type "string" "";
	setAttr ".stringOptions[24].type" -type "string" "string";
	setAttr ".stringOptions[25].name" -type "string" "geom displace motion factor";
	setAttr ".stringOptions[25].value" -type "string" "1.0";
	setAttr ".stringOptions[25].type" -type "string" "scalar";
	setAttr ".stringOptions[26].name" -type "string" "contrast all buffers";
	setAttr ".stringOptions[26].value" -type "string" "true";
	setAttr ".stringOptions[26].type" -type "string" "boolean";
	setAttr ".stringOptions[27].name" -type "string" "finalgather normal tolerance";
	setAttr ".stringOptions[27].value" -type "string" "25.842";
	setAttr ".stringOptions[27].type" -type "string" "scalar";
	setAttr ".stringOptions[28].name" -type "string" "trace camera clip";
	setAttr ".stringOptions[28].value" -type "string" "false";
	setAttr ".stringOptions[28].type" -type "string" "boolean";
	setAttr ".stringOptions[29].name" -type "string" "unified sampling";
	setAttr ".stringOptions[29].value" -type "string" "true";
	setAttr ".stringOptions[29].type" -type "string" "boolean";
	setAttr ".stringOptions[30].name" -type "string" "samples quality";
	setAttr ".stringOptions[30].value" -type "string" "0.5 0.5 0.5 0.5";
	setAttr ".stringOptions[30].type" -type "string" "color";
	setAttr ".stringOptions[31].name" -type "string" "samples min";
	setAttr ".stringOptions[31].value" -type "string" "1.0";
	setAttr ".stringOptions[31].type" -type "string" "scalar";
	setAttr ".stringOptions[32].name" -type "string" "samples max";
	setAttr ".stringOptions[32].value" -type "string" "100.0";
	setAttr ".stringOptions[32].type" -type "string" "scalar";
	setAttr ".stringOptions[33].name" -type "string" "samples error cutoff";
	setAttr ".stringOptions[33].value" -type "string" "0.0 0.0 0.0 0.0";
	setAttr ".stringOptions[33].type" -type "string" "color";
	setAttr ".stringOptions[34].name" -type "string" "samples per object";
	setAttr ".stringOptions[34].value" -type "string" "false";
	setAttr ".stringOptions[34].type" -type "string" "boolean";
	setAttr ".stringOptions[35].name" -type "string" "progressive";
	setAttr ".stringOptions[35].value" -type "string" "false";
	setAttr ".stringOptions[35].type" -type "string" "boolean";
	setAttr ".stringOptions[36].name" -type "string" "progressive max time";
	setAttr ".stringOptions[36].value" -type "string" "0";
	setAttr ".stringOptions[36].type" -type "string" "integer";
	setAttr ".stringOptions[37].name" -type "string" "progressive subsampling size";
	setAttr ".stringOptions[37].value" -type "string" "1";
	setAttr ".stringOptions[37].type" -type "string" "integer";
	setAttr ".stringOptions[38].name" -type "string" "iray";
	setAttr ".stringOptions[38].value" -type "string" "false";
	setAttr ".stringOptions[38].type" -type "string" "boolean";
	setAttr ".stringOptions[39].name" -type "string" "light relative scale";
	setAttr ".stringOptions[39].value" -type "string" "0.31831";
	setAttr ".stringOptions[39].type" -type "string" "scalar";
	setAttr ".stringOptions[40].name" -type "string" "trace camera motion vectors";
	setAttr ".stringOptions[40].value" -type "string" "false";
	setAttr ".stringOptions[40].type" -type "string" "boolean";
	setAttr ".stringOptions[41].name" -type "string" "ray differentials";
	setAttr ".stringOptions[41].value" -type "string" "true";
	setAttr ".stringOptions[41].type" -type "string" "boolean";
	setAttr ".stringOptions[42].name" -type "string" "environment lighting mode";
	setAttr ".stringOptions[42].value" -type "string" "off";
	setAttr ".stringOptions[42].type" -type "string" "string";
	setAttr ".stringOptions[43].name" -type "string" "environment lighting quality";
	setAttr ".stringOptions[43].value" -type "string" "0.167";
	setAttr ".stringOptions[43].type" -type "string" "scalar";
	setAttr ".stringOptions[44].name" -type "string" "environment lighting shadow";
	setAttr ".stringOptions[44].value" -type "string" "transparent";
	setAttr ".stringOptions[44].type" -type "string" "string";
createNode mentalrayFramebuffer -s -n "miDefaultFramebuffer";
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 5 ".lnk";
	setAttr -s 5 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode ilrOptionsNode -s -n "TurtleRenderOptions";
lockNode -l 1 ;
createNode ilrUIOptionsNode -s -n "TurtleUIOptions";
lockNode -l 1 ;
createNode ilrBakeLayerManager -s -n "TurtleBakeLayerManager";
lockNode -l 1 ;
createNode ilrBakeLayer -s -n "TurtleDefaultBakeLayer";
lockNode -l 1 ;
createNode polyPlane -n "polyPlane1";
	setAttr ".sw" 1;
	setAttr ".sh" 1;
	setAttr ".cuv" 2;
createNode vsVmatToTex -n "wall_blocker_vmat";
	setAttr ".vmat" -type "string" "models/personal/tristan/materials/wall_blocker.vmat";
	setAttr ".bme" yes;
createNode file -n "wall_blockerFile";
createNode lambert -n "wall_blocker";
	addAttr -ci true -sn "FBX_vmatPath" -ln "FBX_vmatPath" -dt "string";
createNode shadingEngine -n "wall_blockerSG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode file -n "wall_blocker_bumpMap_file";
	setAttr ".ail" yes;
createNode bump2d -n "wall_blocker_bump2d";
	setAttr ".bi" 1;
	setAttr ".vc2" -type "float3" 9.9999997e-006 9.9999997e-006 0 ;
createNode file -n "wall_blocker_transMap_file";
	addAttr -ci true -sn "resolution" -ln "resolution" -dv 32 -at "long";
	setAttr ".i" yes;
	setAttr ".resolution" 256;
createNode lambert -n "lambert2";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode hyperGraphInfo -n "nodeEditorPanel1Info";
createNode hyperView -n "hyperView1";
	setAttr ".dag" no;
createNode hyperLayout -n "hyperLayout1";
	setAttr ".ihi" 0;
	setAttr -s 83 ".hyp";
	setAttr ".hyp[0].nvs" 1920;
	setAttr ".hyp[1].nvs" 1920;
	setAttr ".hyp[2].nvs" 1920;
	setAttr ".hyp[3].nvs" 1920;
	setAttr ".hyp[4].nvs" 1920;
	setAttr ".hyp[5].nvs" 1920;
	setAttr ".hyp[6].nvs" 1920;
	setAttr ".hyp[7].nvs" 1920;
	setAttr ".hyp[8].nvs" 1920;
	setAttr ".hyp[9].nvs" 1920;
	setAttr ".hyp[10].nvs" 1920;
	setAttr ".hyp[11].nvs" 1920;
	setAttr ".hyp[12].nvs" 1920;
	setAttr ".hyp[13].nvs" 1920;
	setAttr ".hyp[14].nvs" 1920;
	setAttr ".hyp[15].nvs" 1920;
	setAttr ".hyp[16].nvs" 1920;
	setAttr ".hyp[17].nvs" 1920;
	setAttr ".hyp[18].nvs" 1920;
	setAttr ".hyp[19].nvs" 1920;
	setAttr ".hyp[20].nvs" 1920;
	setAttr ".hyp[21].nvs" 1920;
	setAttr ".hyp[22].nvs" 1920;
	setAttr ".hyp[23].nvs" 1920;
	setAttr ".hyp[24].nvs" 1920;
	setAttr ".hyp[25].nvs" 1920;
	setAttr ".hyp[26].nvs" 1920;
	setAttr ".hyp[27].nvs" 1920;
	setAttr ".hyp[28].nvs" 1920;
	setAttr ".hyp[29].nvs" 1920;
	setAttr ".hyp[30].nvs" 1920;
	setAttr ".hyp[31].nvs" 1920;
	setAttr ".hyp[32].nvs" 1920;
	setAttr ".hyp[33].nvs" 1920;
	setAttr ".hyp[34].nvs" 1920;
	setAttr ".hyp[35].nvs" 1920;
	setAttr ".hyp[36].nvs" 1920;
	setAttr ".hyp[37].nvs" 1920;
	setAttr ".hyp[38].nvs" 1920;
	setAttr ".hyp[39].nvs" 1920;
	setAttr ".hyp[40].nvs" 1920;
	setAttr ".hyp[41].nvs" 1920;
	setAttr ".hyp[42].nvs" 1920;
	setAttr ".hyp[43].nvs" 1920;
	setAttr ".hyp[44].nvs" 1920;
	setAttr ".hyp[45].nvs" 1920;
	setAttr ".hyp[46].nvs" 1920;
	setAttr ".hyp[47].nvs" 1920;
	setAttr ".hyp[48].nvs" 1920;
	setAttr ".hyp[49].nvs" 1920;
	setAttr ".hyp[50].nvs" 1920;
	setAttr ".hyp[51].nvs" 1920;
	setAttr ".hyp[52].nvs" 1920;
	setAttr ".hyp[53].nvs" 1920;
	setAttr ".hyp[54].nvs" 1920;
	setAttr ".hyp[55].nvs" 1920;
	setAttr ".hyp[56].nvs" 1920;
	setAttr ".hyp[57].nvs" 1920;
	setAttr ".hyp[58].nvs" 1920;
	setAttr ".hyp[59].nvs" 1920;
	setAttr ".hyp[60].nvs" 1920;
	setAttr ".hyp[61].nvs" 1920;
	setAttr ".hyp[62].nvs" 1920;
	setAttr ".hyp[63].nvs" 1920;
	setAttr ".hyp[64].nvs" 1920;
	setAttr ".hyp[65].nvs" 1920;
	setAttr ".hyp[66].nvs" 1920;
	setAttr ".hyp[67].nvs" 1920;
	setAttr ".hyp[68].nvs" 1920;
	setAttr ".hyp[69].nvs" 1920;
	setAttr ".hyp[70].nvs" 1920;
	setAttr ".hyp[71].nvs" 1920;
	setAttr ".hyp[72].nvs" 1920;
	setAttr ".hyp[73].nvs" 1920;
	setAttr ".hyp[74].nvs" 1920;
	setAttr ".hyp[75].nvs" 1920;
	setAttr ".hyp[76].nvs" 1920;
	setAttr ".hyp[77].nvs" 1920;
	setAttr ".hyp[78].nvs" 1920;
	setAttr ".hyp[79].nvs" 1920;
	setAttr ".hyp[80].nvs" 1920;
	setAttr ".hyp[81].nvs" 1920;
	setAttr ".hyp[82].nvs" 1920;
	setAttr ".anf" yes;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n"
		+ "            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n"
		+ "            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n"
		+ "                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n"
		+ "            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n"
		+ "            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n"
		+ "            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n"
		+ "                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n"
		+ "            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n"
		+ "            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n"
		+ "            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n"
		+ "                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n"
		+ "                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n"
		+ "            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n"
		+ "                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n"
		+ "                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n"
		+ "            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n"
		+ "            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n"
		+ "                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n"
		+ "                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n"
		+ "                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n"
		+ "                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n"
		+ "                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n"
		+ "                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n"
		+ "                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n"
		+ "                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\t\tif (`objExists nodeEditorPanel1Info`) nodeEditor -e -restoreInfo nodeEditorPanel1Info $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n"
		+ "                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -island 0\n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;\n\t\t\tif (`objExists nodeEditorPanel1Info`) nodeEditor -e -restoreInfo nodeEditorPanel1Info $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 20 100 -ps 2 80 100 $gMainPane;\"\n"
		+ "\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n\t\t\t\t\t\"outlinerPanel\"\n\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showReferenceNodes 1\\n    -showReferenceMembers 1\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showReferenceNodes 1\\n    -showReferenceMembers 1\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 32 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode vstExportNode -n "autochap_exportNode";
	setAttr ".ei[0].exportFile" -type "string" "auto_chap_model";
	setAttr ".ei[0].fs" 1;
	setAttr ".ei[0].fe" 24;
createNode polyTweakUV -n "polyTweakUV2";
	setAttr ".uopa" yes;
	setAttr -s 4 ".uvtk[0:3]" -type "float2" 0.12473092 4.9995e-005 -0.10770991
		 7.4992509e-005 0.12473092 -4.9985811e-005 -0.10770991 -7.5013537e-005;
createNode polyAutoProj -n "polyAutoProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:17]";
	setAttr ".ix" -type "matrix" 0.38453684507058195 0 0 0 0 0.38453684507058195 0 0
		 0 0 0.38453684507058195 0 -6 6 0 1;
	setAttr ".s" -type "double3" 4.0000001006947308 4.0000001006947308 4.0000001006947308 ;
	setAttr ".ps" 0.20000000298023224;
	setAttr ".dl" yes;
createNode polyMapSewMove -n "polyMapSewMove1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[4]";
createNode polyMapSewMove -n "polyMapSewMove2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[8]";
createNode polyMapSewMove -n "polyMapSewMove3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[9]";
createNode polyMapSewMove -n "polyMapSewMove4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[17]";
createNode polyMapSewMove -n "polyMapSewMove5";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[21]";
createNode polyMapSewMove -n "polyMapSewMove6";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[20]";
createNode polyMapSewMove -n "polyMapSewMove7";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[32]";
createNode polyMapSewMove -n "polyMapSewMove8";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[33]";
createNode polyMapSewMove -n "polyMapSewMove9";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[28]";
createNode polyMapSewMove -n "polyMapSewMove10";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[3]";
createNode polyMapSewMove -n "polyMapSewMove11";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[14]";
createNode polyMapSewMove -n "polyMapSewMove12";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[27]";
createNode polyMapSewMove -n "polyMapSewMove13";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[6]" "e[23]" "e[26]";
createNode polyTweakUV -n "polyTweakUV3";
	setAttr ".uopa" yes;
	setAttr -s 42 ".uvtk[0:41]" -type "float2" 0.0076285042 0.36825895 0.0035544084
		 0.36825895 0.0035544084 -0.33805707 0.0076285023 -0.33805707 -0.061614323 0.29101485
		 0.0076284679 -0.34213123 0.011702564 -0.34213123 0.011702599 -0.33805707 -0.061614323
		 -0.4153012 0.015776698 -0.33805707 0.015776699 0.36825895 0.011702599 0.36825895
		 -0.10752302 -0.41937524 -0.11159717 -0.41937536 0.015776696 0.37233305 0.011702599
		 0.37233305 0.019850796 0.36825895 -0.10344902 -0.4153012 -0.10752311 -0.41530114
		 0.019850798 -0.33805707 -0.11567131 0.29101485 -0.11159723 -0.41530126 -0.11567131
		 -0.4153012 -0.11159722 0.29101485 -0.077910639 -0.4153012 -0.073836543 -0.41530055
		 -0.073836543 0.29101485 -0.077910639 0.29101485 -0.065688685 0.29508913 -0.069762789
		 0.29508883 -0.069762461 0.29101479 -0.065688401 0.29101497 -0.11974541 0.29101485
		 -0.11974541 -0.4153012 -0.069762446 -0.41530186 -0.065688416 -0.4153012 -0.069764964
		 -0.41937655 -0.10344902 0.29101485 -0.10752312 0.29508895 -0.073839061 -0.41937405
		 -0.10752312 0.29101485 -0.11159722 0.29508895;
createNode vsVmatToTex -n "autochap_hand_vmat";
	setAttr ".vmat" -type "string" "models/vr/autochap_hand.vmat";
	setAttr ".bme" yes;
createNode file -n "autochap_handFile";
createNode lambert -n "autochap_hand";
	addAttr -ci true -sn "FBX_vmatPath" -ln "FBX_vmatPath" -dt "string";
createNode shadingEngine -n "autochap_handSG";
	setAttr ".ihi" 0;
	setAttr -s 9 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 5 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :initialShadingGroup;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -av -cb on ".micc";
	setAttr -cb on ".mica";
	setAttr -cb on ".micw";
	setAttr -cb on ".mirw";
select -ne :initialParticleSE;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -cb on ".micc";
	setAttr -cb on ".mica";
	setAttr -cb on ".micw";
	setAttr -cb on ".mirw";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 5 ".s";
select -ne :defaultTextureList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 4 ".tx";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr -s 3 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".macc";
	setAttr -k on ".macd";
	setAttr -k on ".macq";
	setAttr -k on ".mcfr";
	setAttr -cb on ".ifg";
	setAttr -k on ".clip";
	setAttr -k on ".edm";
	setAttr -k on ".edl";
	setAttr -cb on ".ren";
	setAttr -av -k on ".esr";
	setAttr -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -k on ".outf";
	setAttr -cb on ".imfkey";
	setAttr -k on ".gama";
	setAttr -k on ".an";
	setAttr -cb on ".ar";
	setAttr ".fs" 1;
	setAttr ".ef" 10;
	setAttr -av -k on ".bfs";
	setAttr -cb on ".me";
	setAttr -cb on ".se";
	setAttr -k on ".be";
	setAttr -cb on ".ep";
	setAttr -k on ".fec";
	setAttr -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -cb on ".pff";
	setAttr -cb on ".peie";
	setAttr -cb on ".ifp";
	setAttr -k on ".comp";
	setAttr -k on ".cth";
	setAttr -k on ".soll";
	setAttr -k on ".rd";
	setAttr -k on ".lp";
	setAttr -k on ".sp";
	setAttr -k on ".shs";
	setAttr -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -k on ".mm";
	setAttr -k on ".npu";
	setAttr -k on ".itf";
	setAttr -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -k on ".uf";
	setAttr -k on ".oi";
	setAttr -k on ".rut";
	setAttr -av -k on ".mbf";
	setAttr -k on ".afp";
	setAttr -k on ".pfb";
	setAttr -k on ".pram";
	setAttr -k on ".poam";
	setAttr -k on ".prlm";
	setAttr -k on ".polm";
	setAttr -cb on ".prm";
	setAttr -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -k on ".ubc";
	setAttr -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -k on ".udbx";
	setAttr -k on ".smc";
	setAttr -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -k on ".tlwd";
	setAttr -k on ".tlht";
	setAttr -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -k on ".ope";
	setAttr -k on ".oppf";
	setAttr -cb on ".hbl";
select -ne :defaultResolution;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr -av ".w";
	setAttr -av ".h";
	setAttr -k on ".pa" 1;
	setAttr -k on ".al";
	setAttr -av ".dar";
	setAttr -k on ".ldar";
	setAttr -k on ".off";
	setAttr -k on ".fld";
	setAttr -k on ".zsl";
select -ne :defaultLightSet;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr ".ro" yes;
select -ne :defaultObjectSet;
	setAttr ".ro" yes;
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr -k off ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off ".enpt";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 18 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 18 0 1 1 1 1 1
		 1 0 0 0 0 0 0 0 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".rp";
	setAttr -k on ".cai";
	setAttr -k on ".coi";
	setAttr -cb on ".bc";
	setAttr -av -k on ".bcb";
	setAttr -av -k on ".bcg";
	setAttr -av -k on ".bcr";
	setAttr -k on ".ei";
	setAttr -k on ".ex";
	setAttr -av -k on ".es";
	setAttr -av -k on ".ef";
	setAttr -av -k on ".bf";
	setAttr -k on ".fii";
	setAttr -av -k on ".sf";
	setAttr -k on ".gr";
	setAttr -k on ".li";
	setAttr -k on ".ls";
	setAttr -k on ".mb";
	setAttr -k on ".ti";
	setAttr -k on ".txt";
	setAttr -k on ".mpr";
	setAttr -k on ".wzd";
	setAttr ".fn" -type "string" "im";
	setAttr -k on ".if";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
	setAttr -k on ".as";
	setAttr -k on ".ds";
	setAttr -k on ".lm";
	setAttr -k on ".fir";
	setAttr -k on ".aap";
	setAttr -k on ".gh";
	setAttr -cb on ".sd";
connectAttr "polyTweakUV2.out" "pPlaneShape1.i";
connectAttr "polyTweakUV2.uvtk[0]" "pPlaneShape1.uvst[0].uvtw";
connectAttr "polyTweakUV3.out" "polySurfaceShape7.i";
connectAttr "polyTweakUV3.uvtk[0]" "polySurfaceShape7.uvst[0].uvtw";
connectAttr ":mentalrayGlobals.msg" ":mentalrayItemsList.glb";
connectAttr ":miDefaultOptions.msg" ":mentalrayItemsList.opt" -na;
connectAttr ":miDefaultFramebuffer.msg" ":mentalrayItemsList.fb" -na;
connectAttr ":miDefaultOptions.msg" ":mentalrayGlobals.opt";
connectAttr ":miDefaultFramebuffer.msg" ":mentalrayGlobals.fb";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "wall_blockerSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "autochap_handSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "wall_blockerSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "autochap_handSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":TurtleDefaultBakeLayer.idx" ":TurtleBakeLayerManager.bli[0]";
connectAttr ":TurtleRenderOptions.msg" ":TurtleDefaultBakeLayer.rset";
connectAttr "wall_blocker_vmat.cfp" "wall_blockerFile.ftn";
connectAttr "wall_blockerFile.oc" "wall_blocker.c";
connectAttr "wall_blocker_vmat.vmat" "wall_blocker.FBX_vmatPath";
connectAttr "wall_blocker_bump2d.o" "wall_blocker.n";
connectAttr "wall_blocker_transMap_file.oc" "wall_blocker.it";
connectAttr "wall_blocker.oc" "wall_blockerSG.ss";
connectAttr "wall_blockerSG.msg" "materialInfo1.sg";
connectAttr "wall_blocker.msg" "materialInfo1.m";
connectAttr "wall_blocker_transMap_file.msg" "materialInfo1.t" -na;
connectAttr "wall_blocker_transMap_file.oc" "materialInfo1.tc";
connectAttr "wall_blocker_vmat.bmfp" "wall_blocker_bumpMap_file.ftn";
connectAttr "wall_blocker_bumpMap_file.oa" "wall_blocker_bump2d.bv";
connectAttr "wall_blocker_vmat.trmfp" "wall_blocker_transMap_file.ftn";
connectAttr "lambert2.oc" "lambert2SG.ss";
connectAttr "lambert2SG.msg" "materialInfo2.sg";
connectAttr "lambert2.msg" "materialInfo2.m";
connectAttr "hyperView1.msg" "nodeEditorPanel1Info.b[0]";
connectAttr "hyperLayout1.msg" "hyperView1.hl";
connectAttr "layerManager.msg" "hyperLayout1.hyp[0].dn";
connectAttr "defaultLayer.msg" "hyperLayout1.hyp[1].dn";
connectAttr "renderLayerManager.msg" "hyperLayout1.hyp[2].dn";
connectAttr "defaultRenderLayer.msg" "hyperLayout1.hyp[3].dn";
connectAttr ":TurtleRenderOptions.msg" "hyperLayout1.hyp[4].dn";
connectAttr ":TurtleUIOptions.msg" "hyperLayout1.hyp[5].dn";
connectAttr ":TurtleBakeLayerManager.msg" "hyperLayout1.hyp[6].dn";
connectAttr ":TurtleDefaultBakeLayer.msg" "hyperLayout1.hyp[7].dn";
connectAttr "polyPlane1.msg" "hyperLayout1.hyp[8].dn";
connectAttr "pPlane1.msg" "hyperLayout1.hyp[9].dn";
connectAttr "pPlaneShape1.msg" "hyperLayout1.hyp[10].dn";
connectAttr "wall_blocker_vmat.msg" "hyperLayout1.hyp[11].dn";
connectAttr "wall_blockerFile.msg" "hyperLayout1.hyp[12].dn";
connectAttr "wall_blocker.msg" "hyperLayout1.hyp[13].dn";
connectAttr "wall_blockerSG.msg" "hyperLayout1.hyp[14].dn";
connectAttr "materialInfo1.msg" "hyperLayout1.hyp[15].dn";
connectAttr "wall_blocker_bumpMap_file.msg" "hyperLayout1.hyp[16].dn";
connectAttr "wall_blocker_bump2d.msg" "hyperLayout1.hyp[17].dn";
connectAttr "wall_blocker_transMap_file.msg" "hyperLayout1.hyp[18].dn";
connectAttr "lambert2.msg" "hyperLayout1.hyp[20].dn";
connectAttr "lambert2SG.msg" "hyperLayout1.hyp[21].dn";
connectAttr "materialInfo2.msg" "hyperLayout1.hyp[22].dn";
connectAttr "polySurface7.msg" "hyperLayout1.hyp[28].dn";
connectAttr "polySurfaceShape7.msg" "hyperLayout1.hyp[29].dn";
connectAttr "|group1|polySurface7|polySurfaceShape8.msg" "hyperLayout1.hyp[30].dn"
		;
connectAttr "uiConfigurationScriptNode.msg" "hyperLayout1.hyp[31].dn";
connectAttr "sceneConfigurationScriptNode.msg" "hyperLayout1.hyp[32].dn";
connectAttr "autochap_exportNode.msg" "hyperLayout1.hyp[33].dn";
connectAttr "group1.msg" "hyperLayout1.hyp[34].dn";
connectAttr "polyTweakUV2.msg" "hyperLayout1.hyp[35].dn";
connectAttr "polyAutoProj1.msg" "hyperLayout1.hyp[36].dn";
connectAttr "polySurfaceShape17.msg" "hyperLayout1.hyp[37].dn";
connectAttr "polyMapSewMove1.msg" "hyperLayout1.hyp[38].dn";
connectAttr "polyMapSewMove2.msg" "hyperLayout1.hyp[39].dn";
connectAttr "polyMapSewMove3.msg" "hyperLayout1.hyp[40].dn";
connectAttr "polyMapSewMove4.msg" "hyperLayout1.hyp[41].dn";
connectAttr "polyMapSewMove5.msg" "hyperLayout1.hyp[42].dn";
connectAttr "polyMapSewMove6.msg" "hyperLayout1.hyp[43].dn";
connectAttr "polyMapSewMove7.msg" "hyperLayout1.hyp[44].dn";
connectAttr "polyMapSewMove8.msg" "hyperLayout1.hyp[45].dn";
connectAttr "polyMapSewMove9.msg" "hyperLayout1.hyp[46].dn";
connectAttr "polyMapSewMove10.msg" "hyperLayout1.hyp[47].dn";
connectAttr "polyMapSewMove11.msg" "hyperLayout1.hyp[48].dn";
connectAttr "polyMapSewMove12.msg" "hyperLayout1.hyp[49].dn";
connectAttr "polyMapSewMove13.msg" "hyperLayout1.hyp[50].dn";
connectAttr "polyTweakUV3.msg" "hyperLayout1.hyp[51].dn";
connectAttr "polySurface8.msg" "hyperLayout1.hyp[52].dn";
connectAttr "|group1|polySurface8|polySurfaceShape8.msg" "hyperLayout1.hyp[53].dn"
		;
connectAttr "polySurfaceShape18.msg" "hyperLayout1.hyp[54].dn";
connectAttr "polySurfaceShape19.msg" "hyperLayout1.hyp[55].dn";
connectAttr "polySurface9.msg" "hyperLayout1.hyp[56].dn";
connectAttr "polySurfaceShape9.msg" "hyperLayout1.hyp[57].dn";
connectAttr "polySurfaceShape20.msg" "hyperLayout1.hyp[58].dn";
connectAttr "polySurfaceShape21.msg" "hyperLayout1.hyp[59].dn";
connectAttr "polySurface10.msg" "hyperLayout1.hyp[60].dn";
connectAttr "polySurfaceShape10.msg" "hyperLayout1.hyp[61].dn";
connectAttr "polySurfaceShape22.msg" "hyperLayout1.hyp[62].dn";
connectAttr "polySurfaceShape23.msg" "hyperLayout1.hyp[63].dn";
connectAttr "polySurface12.msg" "hyperLayout1.hyp[64].dn";
connectAttr "polySurfaceShape12.msg" "hyperLayout1.hyp[65].dn";
connectAttr "polySurfaceShape26.msg" "hyperLayout1.hyp[66].dn";
connectAttr "polySurfaceShape27.msg" "hyperLayout1.hyp[67].dn";
connectAttr "polySurface13.msg" "hyperLayout1.hyp[68].dn";
connectAttr "polySurfaceShape13.msg" "hyperLayout1.hyp[69].dn";
connectAttr "polySurfaceShape28.msg" "hyperLayout1.hyp[70].dn";
connectAttr "polySurfaceShape29.msg" "hyperLayout1.hyp[71].dn";
connectAttr "polySurface14.msg" "hyperLayout1.hyp[72].dn";
connectAttr "polySurfaceShape14.msg" "hyperLayout1.hyp[73].dn";
connectAttr "polySurfaceShape30.msg" "hyperLayout1.hyp[74].dn";
connectAttr "polySurfaceShape31.msg" "hyperLayout1.hyp[75].dn";
connectAttr "polySurface15.msg" "hyperLayout1.hyp[76].dn";
connectAttr "polySurfaceShape15.msg" "hyperLayout1.hyp[77].dn";
connectAttr "polySurfaceShape32.msg" "hyperLayout1.hyp[78].dn";
connectAttr "polySurfaceShape33.msg" "hyperLayout1.hyp[79].dn";
connectAttr "pPlane1.msg" "autochap_exportNode.ei[0].objects[0]";
connectAttr "polySurface7.msg" "autochap_exportNode.ei[0].objects[1]";
connectAttr "polySurface8.msg" "autochap_exportNode.ei[0].objects[2]";
connectAttr "polySurface9.msg" "autochap_exportNode.ei[0].objects[3]";
connectAttr "polySurface10.msg" "autochap_exportNode.ei[0].objects[4]";
connectAttr "polySurface12.msg" "autochap_exportNode.ei[0].objects[5]";
connectAttr "polySurface13.msg" "autochap_exportNode.ei[0].objects[6]";
connectAttr "polySurface14.msg" "autochap_exportNode.ei[0].objects[7]";
connectAttr "polySurface15.msg" "autochap_exportNode.ei[0].objects[8]";
connectAttr "polyPlane1.out" "polyTweakUV2.ip";
connectAttr "polySurfaceShape17.o" "polyAutoProj1.ip";
connectAttr "polySurfaceShape7.wm" "polyAutoProj1.mp";
connectAttr "polyAutoProj1.out" "polyMapSewMove1.ip";
connectAttr "polyMapSewMove1.out" "polyMapSewMove2.ip";
connectAttr "polyMapSewMove2.out" "polyMapSewMove3.ip";
connectAttr "polyMapSewMove3.out" "polyMapSewMove4.ip";
connectAttr "polyMapSewMove4.out" "polyMapSewMove5.ip";
connectAttr "polyMapSewMove5.out" "polyMapSewMove6.ip";
connectAttr "polyMapSewMove6.out" "polyMapSewMove7.ip";
connectAttr "polyMapSewMove7.out" "polyMapSewMove8.ip";
connectAttr "polyMapSewMove8.out" "polyMapSewMove9.ip";
connectAttr "polyMapSewMove9.out" "polyMapSewMove10.ip";
connectAttr "polyMapSewMove10.out" "polyMapSewMove11.ip";
connectAttr "polyMapSewMove11.out" "polyMapSewMove12.ip";
connectAttr "polyMapSewMove12.out" "polyMapSewMove13.ip";
connectAttr "polyMapSewMove13.out" "polyTweakUV3.ip";
connectAttr "autochap_hand_vmat.cfp" "autochap_handFile.ftn";
connectAttr "autochap_handFile.oc" "autochap_hand.c";
connectAttr "autochap_hand_vmat.vmat" "autochap_hand.FBX_vmatPath";
connectAttr "autochap_hand.oc" "autochap_handSG.ss";
connectAttr "polySurfaceShape15.iog" "autochap_handSG.dsm" -na;
connectAttr "polySurfaceShape14.iog" "autochap_handSG.dsm" -na;
connectAttr "polySurfaceShape13.iog" "autochap_handSG.dsm" -na;
connectAttr "polySurfaceShape12.iog" "autochap_handSG.dsm" -na;
connectAttr "polySurfaceShape10.iog" "autochap_handSG.dsm" -na;
connectAttr "polySurfaceShape9.iog" "autochap_handSG.dsm" -na;
connectAttr "|group1|polySurface8|polySurfaceShape8.iog" "autochap_handSG.dsm" -na
		;
connectAttr "polySurfaceShape7.iog" "autochap_handSG.dsm" -na;
connectAttr "pPlaneShape1.iog" "autochap_handSG.dsm" -na;
connectAttr "autochap_handSG.msg" "materialInfo3.sg";
connectAttr "autochap_hand.msg" "materialInfo3.m";
connectAttr "autochap_handFile.msg" "materialInfo3.t" -na;
connectAttr "wall_blockerSG.pa" ":renderPartition.st" -na;
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "autochap_handSG.pa" ":renderPartition.st" -na;
connectAttr "wall_blocker.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "autochap_hand.msg" ":defaultShaderList1.s" -na;
connectAttr "wall_blockerFile.msg" ":defaultTextureList1.tx" -na;
connectAttr "wall_blocker_bumpMap_file.msg" ":defaultTextureList1.tx" -na;
connectAttr "wall_blocker_transMap_file.msg" ":defaultTextureList1.tx" -na;
connectAttr "autochap_handFile.msg" ":defaultTextureList1.tx" -na;
connectAttr "wall_blocker_vmat.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "wall_blocker_bump2d.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "autochap_hand_vmat.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr ":perspShape.msg" ":defaultRenderGlobals.sc";
// End of auto_chaperone_model.ma
