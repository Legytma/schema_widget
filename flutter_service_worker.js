'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "f0c8c83fae116186d9a17e8feb1fc390",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "a68d2a28c526b3b070aefca4bac93d25",
"assets/NOTICES": "4299e1b1fdb4a65c52205ec586010970",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b14fcf3ee94e3ace300b192e9e7c8c5d",
"assets/packages/schema_widget/assets/draft06-hyper-schema.schema.json": "cff1ee94d471b5339f3f096af6709f7c",
"assets/packages/schema_widget/assets/draft06.schema.json": "b0416a0fd604658844ad0f113e9d4e7a",
"assets/packages/schema_widget/assets/draft07-hyper-schema-output.schema.json": "aae7e082194adecfe1d22bee80c0cd64",
"assets/packages/schema_widget/assets/draft07.schema.json": "d2b7cbc5f93dd51c22d906090d407c7d",
"assets/packages/schema_widget/assets/LegytmaSolucoesInteligentes.png": "fc2e96cf30cdaab005a99bdd9345381b",
"assets/packages/schema_widget/assets/LegytmaSolucoesInteligentesCubico.png": "b1c8974971d92c18e25806417b769301",
"assets/packages/schema_widget/assets/schema/alignment.schema.json": "dbf642ae218b0cb10c2ef8d9e5b71e48",
"assets/packages/schema_widget/assets/schema/alignment_geometry.schema.json": "c6357c204418bb733786711684a4e0cb",
"assets/packages/schema_widget/assets/schema/animation_controller.schema.json": "6ef2f69e78085a4422663f6d01737791",
"assets/packages/schema_widget/assets/schema/app_bar_theme.schema.json": "64286e4c50b043130618c7facfff1c4e",
"assets/packages/schema_widget/assets/schema/argument_callback_lat_lng.schema.json": "45b7ff38b432834369382679f1cefac3",
"assets/packages/schema_widget/assets/schema/async_widget_builder_dynamic.schema.json": "21be75426ace97ae90a54ac8d8b028d6",
"assets/packages/schema_widget/assets/schema/axis.schema.json": "80ab4f773e4749b8c60a5fe9c03d2d33",
"assets/packages/schema_widget/assets/schema/behavior_subject_string.schema.json": "ca776b6246509ec21122663e9d582e15",
"assets/packages/schema_widget/assets/schema/blend_mode.schema.json": "6c31a4396aeac249fc6cd891a78eebeb",
"assets/packages/schema_widget/assets/schema/bool.schema.json": "5b2c40395a2e209bef687a1397533563",
"assets/packages/schema_widget/assets/schema/border.schema.json": "ba47f09256a46f9b2961c3ff80ba5667",
"assets/packages/schema_widget/assets/schema/border_all.schema.json": "e07c50e3f8e5bb100d6f83b8a50a5820",
"assets/packages/schema_widget/assets/schema/border_default.schema.json": "3c86040c411f46485e38ee0b6764c3a1",
"assets/packages/schema_widget/assets/schema/border_fromBorderSide.schema.json": "20e1c91571807233a9c89f27e0e977c6",
"assets/packages/schema_widget/assets/schema/border_lerp.schema.json": "efca671b4a5dd21fdb7295e0a41e946e",
"assets/packages/schema_widget/assets/schema/border_merge.schema.json": "d6bc051447ba734c0d7e15ea695a039c",
"assets/packages/schema_widget/assets/schema/border_radius.schema.json": "12830bce624af9b65b8607c09219ba01",
"assets/packages/schema_widget/assets/schema/border_radius_all.schema.json": "17bb5d28c27717c0440c8922de98def6",
"assets/packages/schema_widget/assets/schema/border_radius_circular.schema.json": "5a53be2678497597cd0002eaaf63ff08",
"assets/packages/schema_widget/assets/schema/border_radius_geometry.schema.json": "5119b22cbb18bcded9af12d9473553b7",
"assets/packages/schema_widget/assets/schema/border_radius_horizontal.schema.json": "3a35a96d073b901920edd5f087a2b0d5",
"assets/packages/schema_widget/assets/schema/border_radius_lerp.schema.json": "ddce7a7e1c0f67a2d83e7b08ba0b13a1",
"assets/packages/schema_widget/assets/schema/border_radius_object.schema.json": "3f01c0740a169a416b4b2c3e346f2570",
"assets/packages/schema_widget/assets/schema/border_radius_only.schema.json": "507404f5d3bf8ff5d7de599ced794618",
"assets/packages/schema_widget/assets/schema/border_radius_string.schema.json": "cfb11fc866fef36cdfa4155d25182e3c",
"assets/packages/schema_widget/assets/schema/border_radius_vertical.schema.json": "b3ed92fa4a7ad0f1b499ada63766184e",
"assets/packages/schema_widget/assets/schema/border_radius_zero.schema.json": "f2a6b061f83ebab1edfd722cc65efb28",
"assets/packages/schema_widget/assets/schema/border_side.schema.json": "1ba66ec4da917c84f1a0bb849fb60261",
"assets/packages/schema_widget/assets/schema/border_side_default.schema.json": "df7687cf2fcaf467d1eeb162edb993f6",
"assets/packages/schema_widget/assets/schema/border_side_lerp.schema.json": "10d160a3deb5d6592e5173fa66209530",
"assets/packages/schema_widget/assets/schema/border_side_merge.schema.json": "46c8f1639e7cfceb137600b710b9ef38",
"assets/packages/schema_widget/assets/schema/border_side_none.schema.json": "4a17b6b314360be4b84f04d5ba3949e6",
"assets/packages/schema_widget/assets/schema/border_style.schema.json": "2d441d9afd2b1fbfa2a7ef1277f77ff9",
"assets/packages/schema_widget/assets/schema/bottom_app_bar_theme.schema.json": "ade7b5d83feb80ab39f35d5e1987c733",
"assets/packages/schema_widget/assets/schema/bottom_sheet_theme_data.schema.json": "afad6cfe482c7f067ca60f22596d7472",
"assets/packages/schema_widget/assets/schema/box_border.schema.json": "4df73025b665793db4710bbf59136ab0",
"assets/packages/schema_widget/assets/schema/box_constraints.schema.json": "b11c895a28691cf0a8ad83c2947b966e",
"assets/packages/schema_widget/assets/schema/box_constraints_default.schema.json": "8b536a307f71d898d4085a7158503cf5",
"assets/packages/schema_widget/assets/schema/box_constraints_expand.schema.json": "d42aebea23693d032a66a4fa1a2b75ca",
"assets/packages/schema_widget/assets/schema/box_constraints_lerp.schema.json": "1a68c5b6cc809cd9e1575fcba649aa96",
"assets/packages/schema_widget/assets/schema/box_constraints_loose.schema.json": "a957e0ecaf8d527d3e4484a7fa5c5f58",
"assets/packages/schema_widget/assets/schema/box_constraints_tightFor.schema.json": "16dbebcdb7699cedfbaccd5b489e3ada",
"assets/packages/schema_widget/assets/schema/box_constraints_tightForFinite.schema.json": "37d56f05bf9800d68e042603727d54ea",
"assets/packages/schema_widget/assets/schema/box_decoration.schema.json": "ff55d2531727db09cd9b82f515e1f46c",
"assets/packages/schema_widget/assets/schema/box_fit.schema.json": "d00f706801fef6dbed3060547271257d",
"assets/packages/schema_widget/assets/schema/box_shadow.schema.json": "e0e89825887a4161382196ed5785ed3e",
"assets/packages/schema_widget/assets/schema/box_shape.schema.json": "0449f5163dc9d91c838f9362b9773c2c",
"assets/packages/schema_widget/assets/schema/brightness.schema.json": "a41d0c2df5c6e12cf73f56177065e823",
"assets/packages/schema_widget/assets/schema/button_bar_layout_behavior.schema.json": "ebcc5c345c336db9cc90f9694e807d67",
"assets/packages/schema_widget/assets/schema/button_bar_theme_data.schema.json": "db4ca9372ffa6eaec164bac68fc39923",
"assets/packages/schema_widget/assets/schema/button_text_theme.schema.json": "5dce8069d9a61ff345211b621c971c49",
"assets/packages/schema_widget/assets/schema/button_theme_data.schema.json": "355bed667612a81813acc8ef9e71df3a",
"assets/packages/schema_widget/assets/schema/camera_position.schema.json": "fb97781aca0202dac81d8e03b69a9930",
"assets/packages/schema_widget/assets/schema/camera_position_callback.schema.json": "a79d8ccb6403280b281920beb0f10d6c",
"assets/packages/schema_widget/assets/schema/camera_target_bounds.schema.json": "863bdab49351e560f3ff8a4603b0c9fd",
"assets/packages/schema_widget/assets/schema/card_theme.schema.json": "f95d598aacd1e0f7e1364f3163ce7e55",
"assets/packages/schema_widget/assets/schema/chip_theme_data.schema.json": "e5d83d4d4baccc5b02ba3c1a65d147f9",
"assets/packages/schema_widget/assets/schema/clip.schema.json": "5d411dc5c7f157e95273992553a8b873",
"assets/packages/schema_widget/assets/schema/color.schema.json": "45d94073b76a7d349ddef190e4f8a2cb",
"assets/packages/schema_widget/assets/schema/color_filter.schema.json": "29067249d02824d7d2e3e13364f1e781",
"assets/packages/schema_widget/assets/schema/color_filter_linear_to_srgb_gamma.schema.json": "f6b6d13d2177ff40df4e77a900097c39",
"assets/packages/schema_widget/assets/schema/color_filter_matrix.schema.json": "04ef92b4b7d1fc2ea40955d11c2f42b1",
"assets/packages/schema_widget/assets/schema/color_filter_mode.schema.json": "50dda12b2bf06f251652be1c48c48408",
"assets/packages/schema_widget/assets/schema/color_filter_srgb_to_linear_gamma.schema.json": "9dd5c12f3d10d6744c0db529048a7d4a",
"assets/packages/schema_widget/assets/schema/color_scheme.schema.json": "9ca5810aab6f46f380c92635412c376e",
"assets/packages/schema_widget/assets/schema/cross_axis_alignment.schema.json": "9b59e508d4843e45857aa59cf4b3772a",
"assets/packages/schema_widget/assets/schema/cupertino_text_theme_data.schema.json": "ce6965c090140ca7602ca87b5ca9d5a5",
"assets/packages/schema_widget/assets/schema/cupertino_theme_data.schema.json": "3bbccef5515d98bb2b858f0af4076f7b",
"assets/packages/schema_widget/assets/schema/curve.schema.json": "efd4cc28861c0327ee359ef01a3f16d9",
"assets/packages/schema_widget/assets/schema/custom_clipper_r_rect.schema.json": "20bc1b26e5fb253db6be2f3d3111e817",
"assets/packages/schema_widget/assets/schema/debug_label.schema.json": "066c04187033edec4a781d046ef1598d",
"assets/packages/schema_widget/assets/schema/decoration.schema.json": "d2f4f5cb44932e73d3c2d37b3c16f846",
"assets/packages/schema_widget/assets/schema/decoration_image.schema.json": "7ba332d02610be24192bb1dba4de5bb3",
"assets/packages/schema_widget/assets/schema/dialog_theme.schema.json": "7005e09ab399076307106ee420aba14c",
"assets/packages/schema_widget/assets/schema/divider_theme_data.schema.json": "817b454663fbaeb61e491c9798d81373",
"assets/packages/schema_widget/assets/schema/double.schema.json": "9149b8b234e4d8f6b895a3172ba1ad06",
"assets/packages/schema_widget/assets/schema/drag_start_behavior.schema.json": "220129c540b586cabe3a98ac48f7e649",
"assets/packages/schema_widget/assets/schema/duration.schema.json": "56b9baac21cce205ebc7810e5bb4ea1e",
"assets/packages/schema_widget/assets/schema/dynamic.schema.json": "6efb42d721da7651a7874d4398bf68cd",
"assets/packages/schema_widget/assets/schema/edge_insets.schema.json": "102ba7e2fff9ce5cac4844e762cba4a0",
"assets/packages/schema_widget/assets/schema/edge_insets_all.schema.json": "3e1ad2f9fa5c718d40a44d7e2fa201c3",
"assets/packages/schema_widget/assets/schema/edge_insets_fromLTRB.schema.json": "7389d122c1f4b4fe0e9a0459d7c52253",
"assets/packages/schema_widget/assets/schema/edge_insets_fromWindowPadding.schema.json": "bd6cdb0379e73a49fb5e90970ec95cb1",
"assets/packages/schema_widget/assets/schema/edge_insets_geometry.schema.json": "e948fb5501dec3dc61177974bb1666bf",
"assets/packages/schema_widget/assets/schema/edge_insets_lerp.schema.json": "bc7c4e694e0a15e0ef1fd10312c53de5",
"assets/packages/schema_widget/assets/schema/edge_insets_object.schema.json": "11566896ada549c30e5c76ed5c111b34",
"assets/packages/schema_widget/assets/schema/edge_insets_only.schema.json": "700d6fe6da518d2c56e967233b752975",
"assets/packages/schema_widget/assets/schema/edge_insets_string.schema.json": "ba59731c1b2a66c1add1e7e0a1e86428",
"assets/packages/schema_widget/assets/schema/edge_insets_symmetric.schema.json": "123633a155e61f6a2c7b661a590da699",
"assets/packages/schema_widget/assets/schema/edge_insets_zero.schema.json": "37a6b4179597d0fdb2e17fb4dbc006ce",
"assets/packages/schema_widget/assets/schema/filter_quality.schema.json": "8fc4c5347ea5c74d104b90ba5bb68976",
"assets/packages/schema_widget/assets/schema/floating_action_button_animator.schema.json": "b3c076a4659183b6ae9fa669e165b5d2",
"assets/packages/schema_widget/assets/schema/floating_action_button_location.schema.json": "f9c30c6115fee78f43cca8afa44a871f",
"assets/packages/schema_widget/assets/schema/floating_action_button_theme_data.schema.json": "176e64e6c38550b67ea6b30ff4d5b224",
"assets/packages/schema_widget/assets/schema/floating_label_behavior.schema.json": "8c049b30fbe0259870e99f4885b857a9",
"assets/packages/schema_widget/assets/schema/flutter_logo_decoration.schema.json": "7c246740a39c945371085b8170a09b29",
"assets/packages/schema_widget/assets/schema/flutter_logo_style.schema.json": "6af0e979db2774953ccbbc341cb2e585",
"assets/packages/schema_widget/assets/schema/focus_node.schema.json": "9712706fd80271188ab866dabbb24d38",
"assets/packages/schema_widget/assets/schema/focus_on_key_callback.schema.json": "a52ff74969f364ce18778e0ee9a656bc",
"assets/packages/schema_widget/assets/schema/font_family.schema.json": "28172fb97ba0b0ced0479cebe752287d",
"assets/packages/schema_widget/assets/schema/font_feature.schema.json": "6fcc088e35efc67d9a1a25c9a4a1c905",
"assets/packages/schema_widget/assets/schema/font_style.schema.json": "46d8b7b3bbf28afe5cbef7ef1f8afc9e",
"assets/packages/schema_widget/assets/schema/font_weight.schema.json": "9484269af8042f97990ffe3fe81d5f35",
"assets/packages/schema_widget/assets/schema/form_field_setter_string.schema.json": "64a6e22b8eb52aaff9fb31fc36c4660d",
"assets/packages/schema_widget/assets/schema/form_field_validator_string.schema.json": "8c5cafc094fddc40a2e5f7cd80e91423",
"assets/packages/schema_widget/assets/schema/generate_app_title.schema.json": "2460e85357fd3d495f96cac589787439",
"assets/packages/schema_widget/assets/schema/gesture_drag_cancel_callback.schema.json": "f6c0b1e30e9a924adac4724a2ef1f2d1",
"assets/packages/schema_widget/assets/schema/gesture_drag_down_callback.schema.json": "c1cc9383eb94e838e2a498d48b1b65cb",
"assets/packages/schema_widget/assets/schema/gesture_drag_end_callback.schema.json": "9eb0cef57369493965771559f93f30c1",
"assets/packages/schema_widget/assets/schema/gesture_drag_start_callback.schema.json": "8330b2fa2fb73d1f25f6b68b9155f10b",
"assets/packages/schema_widget/assets/schema/gesture_drag_update_callback.schema.json": "a975081d93aa1242dfa865e28ec93743",
"assets/packages/schema_widget/assets/schema/gesture_force_press_end_callback.schema.json": "4986eefe860b471a5c527bc0fa627591",
"assets/packages/schema_widget/assets/schema/gesture_force_press_peak_callback.schema.json": "04954a06100f374da72e70ea7a980537",
"assets/packages/schema_widget/assets/schema/gesture_force_press_start_callback.schema.json": "b619282d5648bb152915d8db86112a55",
"assets/packages/schema_widget/assets/schema/gesture_force_press_update_callback.schema.json": "6db5a323153cc185f3f92457e0c99531",
"assets/packages/schema_widget/assets/schema/gesture_long_press_callback.schema.json": "6b0b92bbc1fd4fb630fc623bf1b34899",
"assets/packages/schema_widget/assets/schema/gesture_long_press_end_callback.schema.json": "99823107331559b48da3cd1c9a612bba",
"assets/packages/schema_widget/assets/schema/gesture_long_press_move_update_callback.schema.json": "bafa5efcaef5a45b5f139bf23d7f65be",
"assets/packages/schema_widget/assets/schema/gesture_long_press_start_callback.schema.json": "0b39aaff611f39358eb01116a4bc52ca",
"assets/packages/schema_widget/assets/schema/gesture_long_press_up_callback.schema.json": "f4971a0112d1edd2d10c95738771dd1c",
"assets/packages/schema_widget/assets/schema/gesture_recognizer.schema.json": "daedb7024ce33d426d156c0409edb894",
"assets/packages/schema_widget/assets/schema/gesture_scale_end_callback.schema.json": "a39ae998822ff326fc9c57289e9862e4",
"assets/packages/schema_widget/assets/schema/gesture_scale_start_callback.schema.json": "5f857e18a19baaaade8da4a489c1ba18",
"assets/packages/schema_widget/assets/schema/gesture_scale_update_callback.schema.json": "e24d1a871a4b68e108cc2e505eb5464a",
"assets/packages/schema_widget/assets/schema/gesture_tap_callback.schema.json": "c01bae6f1d84d617cb1c2f7418e6fcf0",
"assets/packages/schema_widget/assets/schema/gesture_tap_cancel_callback.schema.json": "7e33c4bea9bb929353d6c44eb9004cd4",
"assets/packages/schema_widget/assets/schema/gesture_tap_down_callback.schema.json": "9def68a90ba9757c10ae47e0ae636e6c",
"assets/packages/schema_widget/assets/schema/gesture_tap_up_callback.schema.json": "bae847b50046d63e75bdac0c53f31f5b",
"assets/packages/schema_widget/assets/schema/global_key_navigator_state.schema.json": "d3bdec74a2f258e9f123ffeade4e2442",
"assets/packages/schema_widget/assets/schema/gradient.schema.json": "9af916217f8e2c9e70be503928367647",
"assets/packages/schema_widget/assets/schema/grid_view_params.schema.json": "3ea7f78b4f261616dcd21e978d4cdf13",
"assets/packages/schema_widget/assets/schema/hit_test_behavior.schema.json": "c86663b3924be418a6e9119a36547187",
"assets/packages/schema_widget/assets/schema/icon_data.schema.json": "df7a42cc5c9427dd33890a4277aa0528",
"assets/packages/schema_widget/assets/schema/icon_theme_data.schema.json": "2b3228b8cd18d13427acf1827ffaf5f9",
"assets/packages/schema_widget/assets/schema/image_frame_builder.schema.json": "aa05f260d5ae8262dc4036b0bcfc2cfb",
"assets/packages/schema_widget/assets/schema/image_loading_builder.schema.json": "5b31e8638342d5bc1b11584d14995e11",
"assets/packages/schema_widget/assets/schema/image_provider_dynamic.schema.json": "f5fba5651a5514f4b97d0f7bffb39b26",
"assets/packages/schema_widget/assets/schema/image_repeat.schema.json": "8dccb198c311d7379396bea8eec5ff81",
"assets/packages/schema_widget/assets/schema/indexed_widget_builder.schema.json": "0adaf7420f4dfeff29755e303dd0c5c4",
"assets/packages/schema_widget/assets/schema/input_border.schema.json": "4f37d90e46fe8279cf9849cf42d7275e",
"assets/packages/schema_widget/assets/schema/input_counter_widget_builder.schema.json": "c808f556c19a1c9c86fc4ccb5c1af017",
"assets/packages/schema_widget/assets/schema/input_decoration.schema.json": "e035d3eddae1a2c9b24970c60c9c975b",
"assets/packages/schema_widget/assets/schema/input_decoration_theme.schema.json": "88f346ae48ebda2712c6aba78511f3b4",
"assets/packages/schema_widget/assets/schema/int.schema.json": "c098a659cfe3582b44fb3abade688db2",
"assets/packages/schema_widget/assets/schema/interactive_ink_feature_factory.schema.json": "1612369bb7f2279485626f15d1064540",
"assets/packages/schema_widget/assets/schema/iterable_locale.schema.json": "4e6de4a9c23e66a45b5857ccab6c3d82",
"assets/packages/schema_widget/assets/schema/iterable_localizations_delegate_dynamic.schema.json": "8656286ea5a6f1b26d37c482ea552c24",
"assets/packages/schema_widget/assets/schema/lat_lng.schema.json": "1154886e053b6ff2a543418d23a5a43e",
"assets/packages/schema_widget/assets/schema/LICENSE": "86d3f3a95c324c9479bd8986968f4327",
"assets/packages/schema_widget/assets/schema/list_box_shadow.schema.json": "0dc6fadd2bb9d98ba7a4c711543a5ca6",
"assets/packages/schema_widget/assets/schema/list_double.schema.json": "1c0fb4bb088bc72c4187f454c0e9df0d",
"assets/packages/schema_widget/assets/schema/list_font_family.schema.json": "8390bbcdb01d3bc57c2f885cb789469e",
"assets/packages/schema_widget/assets/schema/list_font_feature.schema.json": "30ff9c6ef03300dcee642e093f974c26",
"assets/packages/schema_widget/assets/schema/list_inline_span.schema.json": "8f183178d6f525b1ca41bfd9e3ecd9dd",
"assets/packages/schema_widget/assets/schema/list_navigator_observer.schema.json": "978c5f8e663f4cec8376c8c6051a2c42",
"assets/packages/schema_widget/assets/schema/list_shadow.schema.json": "b82826e7a185339af2d93a8a308b8388",
"assets/packages/schema_widget/assets/schema/list_text_input_formatter.schema.json": "b8f38448d58b1585684d87329e34b4b8",
"assets/packages/schema_widget/assets/schema/list_view_params.schema.json": "a33261e258fa44976c96bce317c50941",
"assets/packages/schema_widget/assets/schema/list_widget.schema.json": "97bc9c7afcfe527de3fc5aa90fc0a6cd",
"assets/packages/schema_widget/assets/schema/locale.schema.json": "aed8de3358f1d95f144726019cad0a17",
"assets/packages/schema_widget/assets/schema/locale_list_resolution_callback.schema.json": "2391aec4ebfb87421989bd5774cbb06d",
"assets/packages/schema_widget/assets/schema/locale_resolution_callback.schema.json": "a53d3c8af0d2867ad27d872e508bb25d",
"assets/packages/schema_widget/assets/schema/main_axis_alignment.schema.json": "e0afe736821ad800cf4e6d41bae31a4c",
"assets/packages/schema_widget/assets/schema/main_axis_size.schema.json": "d856301c0321949525d83df2a1a1d2c1",
"assets/packages/schema_widget/assets/schema/map_created_callback.schema.json": "0006ee2948573977b6eeb290cc93ea16",
"assets/packages/schema_widget/assets/schema/map_schema_type_widget_template_dynamic.schema.json": "32d6ef7ea87dd4cee196b5daada1c347",
"assets/packages/schema_widget/assets/schema/map_string_dynamic.schema.json": "96a96bc77dafe791b29da810a06a5d3b",
"assets/packages/schema_widget/assets/schema/map_string_widget_template_dynamic.schema.json": "7e4eb7aa1be3debe2bb90b4dc264d86e",
"assets/packages/schema_widget/assets/schema/map_type.schema.json": "351ad12a7ca4fc60cfdd779810f44df3",
"assets/packages/schema_widget/assets/schema/material_banner_theme_data.schema.json": "efd4c9b69a9e6ab580c7c706fc0fdd89",
"assets/packages/schema_widget/assets/schema/material_color.schema.json": "58d9e0b437a1b8d41c78487f7fc06381",
"assets/packages/schema_widget/assets/schema/material_tap_target_size.schema.json": "0c03a90715b7bcbf42a02824c95c2e9e",
"assets/packages/schema_widget/assets/schema/matrix4.schema.json": "303ceb968c12644fdcc0a0a417c5c9be",
"assets/packages/schema_widget/assets/schema/min_max_zoom_preference.schema.json": "1d16ed26dceba29e19a894e2e3b29921",
"assets/packages/schema_widget/assets/schema/navigation_type.schema.json": "4824482ee1b553939d10c8860b58a94b",
"assets/packages/schema_widget/assets/schema/network_image.schema.json": "2d2a1b99b1c35b86f62bf000b7e83a6e",
"assets/packages/schema_widget/assets/schema/notched_shape.schema.json": "1c7c89c57b54d25ab78b1d43c25a5da0",
"assets/packages/schema_widget/assets/schema/offset.schema.json": "28cc7f0c5c0732da0a515fcadeb7c85b",
"assets/packages/schema_widget/assets/schema/offset_default.schema.json": "c53739af139295583a85042a8550301a",
"assets/packages/schema_widget/assets/schema/offset_fromDirection.schema.json": "1e78c38fddb8c2907667588e5a812bb6",
"assets/packages/schema_widget/assets/schema/offset_infinite.schema.json": "39e6704e01729b85396b58a2a1bdf837",
"assets/packages/schema_widget/assets/schema/offset_lerp.schema.json": "2910e147025c5fd4054ee909338690e6",
"assets/packages/schema_widget/assets/schema/offset_zero.schema.json": "0844ca2f99ebd0966eb0ab95dc73c338",
"assets/packages/schema_widget/assets/schema/overflow.schema.json": "5e788f549e6cee4ad926923518bce61e",
"assets/packages/schema_widget/assets/schema/page_controller.schema.json": "0cd3541ff31c72a31b545d9adf314c63",
"assets/packages/schema_widget/assets/schema/page_transitions_builder.schema.json": "23023a82a6a7279023fcea6203175826",
"assets/packages/schema_widget/assets/schema/page_transitions_theme.schema.json": "471e16037b9289a1a26550bcc1caeaa2",
"assets/packages/schema_widget/assets/schema/paint.schema.json": "eb3563fa0b08c3aaaa0ba4639fa032a1",
"assets/packages/schema_widget/assets/schema/picker_type.schema.json": "67269ecb37b751a21b6825a3d1093df8",
"assets/packages/schema_widget/assets/schema/popup_menu_theme_data.schema.json": "f26ab53e5d361c4ddf32c8bfb0b6d054",
"assets/packages/schema_widget/assets/schema/preferred_size_widget.schema.json": "3c0ac5b4390fbcf8c6702f6c96d04b96",
"assets/packages/schema_widget/assets/schema/radius.schema.json": "2bc7b1f8955384abef073c627bfd183b",
"assets/packages/schema_widget/assets/schema/radius_circular.schema.json": "6cc52e9bdae6e98ef0a0566f49852991",
"assets/packages/schema_widget/assets/schema/radius_elliptical.schema.json": "6efda13908cbb0f348c782a145895581",
"assets/packages/schema_widget/assets/schema/radius_lerp.schema.json": "3b8a88f4367df751d25379c46ffc6f55",
"assets/packages/schema_widget/assets/schema/radius_object.schema.json": "8625ac14ba9afac04bfa907d82946319",
"assets/packages/schema_widget/assets/schema/radius_string.schema.json": "dfddd0b224c0ef7cebd3733f76194890",
"assets/packages/schema_widget/assets/schema/radius_zero.schema.json": "570e1f91d13f4abab9fd4a22f718d7a4",
"assets/packages/schema_widget/assets/schema/range_slider_thumb_shape.schema.json": "b42590200ed2734dc37a201a39c746cf",
"assets/packages/schema_widget/assets/schema/range_slider_tick_mark_shape.schema.json": "017476b0c672e5168ea830f22e34c21a",
"assets/packages/schema_widget/assets/schema/range_slider_track_shape.schema.json": "720e2e0523404c28d38ca83609846191",
"assets/packages/schema_widget/assets/schema/range_slider_value_indicator_shape.schema.json": "8cb1f5719ad9fa14f93dd645fe4cce59",
"assets/packages/schema_widget/assets/schema/range_thumb_selector.schema.json": "70bb95e0bd82492546904ce1bd0ff56a",
"assets/packages/schema_widget/assets/schema/README.md": "d2045c445c2731f78a4675557e135ddc",
"assets/packages/schema_widget/assets/schema/rect.schema.json": "20bfba547507441718b233818fd82619",
"assets/packages/schema_widget/assets/schema/rect_fromCenter.schema.json": "90d45fa482a919127b04f7cc207d0e70",
"assets/packages/schema_widget/assets/schema/rect_fromCircle.schema.json": "bf3079b89c8851ef28811fe7529a92b4",
"assets/packages/schema_widget/assets/schema/rect_fromLTRB.schema.json": "9f0bdf9a5135ab8194f5745f8cef10bd",
"assets/packages/schema_widget/assets/schema/rect_fromLTWH.schema.json": "b27b1c149b7238d5fc93a842ef46e893",
"assets/packages/schema_widget/assets/schema/rect_fromPoints.schema.json": "27dbe4564d6b3ba539930b948bbfb4bc",
"assets/packages/schema_widget/assets/schema/rect_largest.schema.json": "a7930738a02a7971f3b7192af437c4d8",
"assets/packages/schema_widget/assets/schema/rect_lerp.schema.json": "7fbba60c0eb3e76a23b846d0dd2e96be",
"assets/packages/schema_widget/assets/schema/rect_zero.schema.json": "5a1340270f665f137703f4806c290055",
"assets/packages/schema_widget/assets/schema/route_factory.schema.json": "dbb4e39c9cbfb28f2ef0593f1b281d39",
"assets/packages/schema_widget/assets/schema/route_handle.schema.json": "e63390ececb17e12c22943fcf206c824",
"assets/packages/schema_widget/assets/schema/save_callback.schema.json": "4205f561bd57fbd841d2c83287979939",
"assets/packages/schema_widget/assets/schema/scroll_physics.schema.json": "fc5089ab9bd9f23ec2977e585f6d8a7a",
"assets/packages/schema_widget/assets/schema/set_circle.schema.json": "6a598348766063865eab16bb28e8144e",
"assets/packages/schema_widget/assets/schema/set_factory_one_sequence_gesture_recognizer.schema.json": "b2d8a8eeb8e035fd1c02e3f387801aca",
"assets/packages/schema_widget/assets/schema/set_marker.schema.json": "db6c3e2d7c9042aaf12a3c661a0182dc",
"assets/packages/schema_widget/assets/schema/set_polygon.schema.json": "ecab0de454e028be03891baafcd8811b",
"assets/packages/schema_widget/assets/schema/set_polyline.schema.json": "243bf414c20f08fe269843cb352a687b",
"assets/packages/schema_widget/assets/schema/shadow.schema.json": "475976bf951e7b61c4d0a8f26efd50e7",
"assets/packages/schema_widget/assets/schema/shape.schema.json": "82832b90d3e9a58f32f0cee0eb6fd393",
"assets/packages/schema_widget/assets/schema/shape_border.schema.json": "9ec5636348c5d0edeceab1084de1a7b2",
"assets/packages/schema_widget/assets/schema/shape_decoration.schema.json": "a99b7b5bb8209101353ecea9da3c6f9b",
"assets/packages/schema_widget/assets/schema/show_value_indicator.schema.json": "8071d041e4c3e0505261ba79627581a5",
"assets/packages/schema_widget/assets/schema/size.schema.json": "0b7784001bd29166e6e1e3387d65a777",
"assets/packages/schema_widget/assets/schema/size_default.schema.json": "a626f4790d8ef017e21e1b3562e7df7c",
"assets/packages/schema_widget/assets/schema/size_fromHeight.schema.json": "555e7c731f6891903b0134de343bf6bf",
"assets/packages/schema_widget/assets/schema/size_fromRadius.schema.json": "8d4aadfe86251e77853e619646bb89c0",
"assets/packages/schema_widget/assets/schema/size_fromWidth.schema.json": "fad8341470f172cd96bcb31066d1590e",
"assets/packages/schema_widget/assets/schema/size_infinite.schema.json": "6f2403b8f0715582493fc70c7b9762a1",
"assets/packages/schema_widget/assets/schema/size_square.schema.json": "4504079176d134932f4dc4084d242a9e",
"assets/packages/schema_widget/assets/schema/size_zero.schema.json": "2f65574203d7e8621e4b1158356b92c2",
"assets/packages/schema_widget/assets/schema/slider_component_shape.schema.json": "1834c81402f9c07b7e0f4a40589a2d04",
"assets/packages/schema_widget/assets/schema/slider_theme_data.schema.json": "183f7f140e572a3b79e51d9ce7870d64",
"assets/packages/schema_widget/assets/schema/slider_tick_mark_shape.schema.json": "fb0cb5cac3173e34dd8944b4513350c1",
"assets/packages/schema_widget/assets/schema/slider_track_shape.schema.json": "53a9e10d7240ffebfbfeda920638daaf",
"assets/packages/schema_widget/assets/schema/snack_bar_behavior.schema.json": "cc5a960a051812345c7bcb0dd82812c0",
"assets/packages/schema_widget/assets/schema/snack_bar_theme_data.schema.json": "17d60ba7cf700161b577c9ccc8afcd32",
"assets/packages/schema_widget/assets/schema/stack_fit.schema.json": "e11c4b319cb5755ae3839d4376868f2e",
"assets/packages/schema_widget/assets/schema/stream_dynamic.schema.json": "7bd826aa64535892d2eaa9b42aad4dae",
"assets/packages/schema_widget/assets/schema/strut_style.schema.json": "ef224120e012dd593428c18e95763618",
"assets/packages/schema_widget/assets/schema/tab_bar_indicator_size.schema.json": "3ac959efa30828d822811181c01caf44",
"assets/packages/schema_widget/assets/schema/tab_bar_theme.schema.json": "e68c7f172329bf8ef0a4c8d211a40f7e",
"assets/packages/schema_widget/assets/schema/target_platform.schema.json": "44308851bb9b60e42a2d62d90a0bacd6",
"assets/packages/schema_widget/assets/schema/text_align.schema.json": "d01c5b476084841091c260a85b15adfc",
"assets/packages/schema_widget/assets/schema/text_align_vertical.schema.json": "c8170010a8634c6e47ce4a41f62d223f",
"assets/packages/schema_widget/assets/schema/text_baseline.schema.json": "0be3e326fb8de64b31e2cb933b7ab2ec",
"assets/packages/schema_widget/assets/schema/text_capitalization.schema.json": "a8b90aaac3a7adf3cba7f3b68b4f7243",
"assets/packages/schema_widget/assets/schema/text_decoration.schema.json": "0de878c94e88634530f0472cb3dafe3a",
"assets/packages/schema_widget/assets/schema/text_decoration_style.schema.json": "d971c0f360ac491526e61a4a150cac6c",
"assets/packages/schema_widget/assets/schema/text_direction.schema.json": "1474c59db7bd3f53a656ea95a0cc3f9c",
"assets/packages/schema_widget/assets/schema/text_input_action.schema.json": "1bf821174685a8a500093ac23066af02",
"assets/packages/schema_widget/assets/schema/text_input_type.schema.json": "1bb91a6d0bb37ecc9451f035789acbe0",
"assets/packages/schema_widget/assets/schema/text_overflow.schema.json": "73ce2662fd2ea3f85e0818051a96a69a",
"assets/packages/schema_widget/assets/schema/text_span.schema.json": "9e626ea1cfd048552180d4968d52a3e4",
"assets/packages/schema_widget/assets/schema/text_style.schema.json": "adbd96122dbb0ee2c005cfce26497014",
"assets/packages/schema_widget/assets/schema/text_theme.schema.json": "ac8137de85bba2c36461613a9725b31f",
"assets/packages/schema_widget/assets/schema/text_width_basis.schema.json": "3286bdd334af8c9547cde0799470cf7b",
"assets/packages/schema_widget/assets/schema/theme_data.schema.json": "df96a8352e3c9230489a27e86d1466d1",
"assets/packages/schema_widget/assets/schema/theme_mode.schema.json": "315356a2635c6778e08590c2e179c6b9",
"assets/packages/schema_widget/assets/schema/toggle_buttons_theme_data.schema.json": "87cb7f38fb06318ae9a5dccaff33d0f4",
"assets/packages/schema_widget/assets/schema/toolbar_options.schema.json": "6161f6f12c64799b83d52fc6f8019fad",
"assets/packages/schema_widget/assets/schema/tooltip_theme_data.schema.json": "e11abe9856ea10a01215514b83abcc8a",
"assets/packages/schema_widget/assets/schema/transition_builder.schema.json": "12c68df8cb70910a957cb6b80ff1b828",
"assets/packages/schema_widget/assets/schema/typography.schema.json": "868eb350b754934cb7c74a2524265f6a",
"assets/packages/schema_widget/assets/schema/underline_tab_indicator.schema.json": "39ad7ef37bdf7c20321e654f12b13004",
"assets/packages/schema_widget/assets/schema/url.schema.json": "35e46d5982bce5b3b7b99d73d0b0e5e4",
"assets/packages/schema_widget/assets/schema/value_changed_bool.schema.json": "4e318a1ebe5872f5d6e61cdcb53c1699",
"assets/packages/schema_widget/assets/schema/value_changed_string.schema.json": "5773ed212175dfa4242d316af9136d21",
"assets/packages/schema_widget/assets/schema/vertical_direction.schema.json": "e1c6eabe3fd07d0664d2403d7892854d",
"assets/packages/schema_widget/assets/schema/void_callback.schema.json": "6c782fd3d6a84ff089fa17307e836fa3",
"assets/packages/schema_widget/assets/schema/widget/align.schema.json": "5390b6618516feefe47f93c73b945b3d",
"assets/packages/schema_widget/assets/schema/widget/animated_container.schema.json": "bec539a0388f9c89339d349713991bd1",
"assets/packages/schema_widget/assets/schema/widget/app_bar.schema.json": "89041e496c86dd91de92771997a52e12",
"assets/packages/schema_widget/assets/schema/widget/aspect_ratio.schema.json": "dc121ab2e6633bcaeb52c8a47e9a6d91",
"assets/packages/schema_widget/assets/schema/widget/base_line.schema.json": "a164f1a112b115b92943f188c8e26a47",
"assets/packages/schema_widget/assets/schema/widget/card.schema.json": "b87695628ec5826cb378aa9b15abb8ff",
"assets/packages/schema_widget/assets/schema/widget/center.schema.json": "d55029ad803da05a165d0fe656a62cfc",
"assets/packages/schema_widget/assets/schema/widget/circle_avatar.schema.json": "f438bce7b186245a07b444ccec9ede55",
"assets/packages/schema_widget/assets/schema/widget/clip_r_rect.schema.json": "f5f151c6dbc14eee2055dd525403e2a3",
"assets/packages/schema_widget/assets/schema/widget/column.schema.json": "0163f737e9e48fcca7238c0ae204ebea",
"assets/packages/schema_widget/assets/schema/widget/container.schema.json": "ea812487c32fe22ffa04e54230164120",
"assets/packages/schema_widget/assets/schema/widget/divider.schema.json": "7d2a16da204af3a9fecf6c3de758aa38",
"assets/packages/schema_widget/assets/schema/widget/drawer.schema.json": "2705236c2479e15ab752bccdd3cb9721",
"assets/packages/schema_widget/assets/schema/widget/drawer_header.schema.json": "dc7a59a810cdd1cbf39501b5196294c4",
"assets/packages/schema_widget/assets/schema/widget/expanded.schema.json": "f905712f36a26b2e7a5dda737b6023b5",
"assets/packages/schema_widget/assets/schema/widget/fitted_box.schema.json": "ff6d7b77d47d73e0fd7559162f0e6922",
"assets/packages/schema_widget/assets/schema/widget/floating_action_button.schema.json": "18f3c1a8e17dc7a8c62de49c97749cf7",
"assets/packages/schema_widget/assets/schema/widget/gesture_detector.schema.json": "353086ccefde2fb1904b2034749d0e2a",
"assets/packages/schema_widget/assets/schema/widget/google_map.schema.json": "2657ad2c16e09bce4a4e881ec7008c84",
"assets/packages/schema_widget/assets/schema/widget/grid_view_widget.schema.json": "08af7dcea0b4afa947ac7780ce8fb76a",
"assets/packages/schema_widget/assets/schema/widget/icon.schema.json": "a0fd12d146eb9c61da8c8daa911df0cd",
"assets/packages/schema_widget/assets/schema/widget/icon_button.schema.json": "3b64e479bf65a20729a810d11ad20743",
"assets/packages/schema_widget/assets/schema/widget/image.schema.json": "29fd13915c1f55863b6e6e4eb37175ad",
"assets/packages/schema_widget/assets/schema/widget/image_asset.schema.json": "1c131f1eb18a891e84d5e50951c33f44",
"assets/packages/schema_widget/assets/schema/widget/image_default.schema.json": "18c6a4a7a70c07579b5a2bc1278dd688",
"assets/packages/schema_widget/assets/schema/widget/image_file.schema.json": "0671a5d59730184cb00213f618be049e",
"assets/packages/schema_widget/assets/schema/widget/image_memory.schema.json": "83c6240335478a7c97370e8dc19ba2be",
"assets/packages/schema_widget/assets/schema/widget/image_network.schema.json": "20e9707ff8bac299390e4bb8409e2059",
"assets/packages/schema_widget/assets/schema/widget/indexed_stack.schema.json": "d9f0250d92498cfb82f24276025d33dc",
"assets/packages/schema_widget/assets/schema/widget/list_tile.schema.json": "be6e6c7bad9d06e367fe75f5597207f0",
"assets/packages/schema_widget/assets/schema/widget/list_view_widget.schema.json": "f3165cb37b5280b2a25c2cec5e03b650",
"assets/packages/schema_widget/assets/schema/widget/material_app.schema.json": "831534173a355db3460151793a5cf88c",
"assets/packages/schema_widget/assets/schema/widget/opacity.schema.json": "d232b67b7a19dc5a45e8ae4296ae0dcd",
"assets/packages/schema_widget/assets/schema/widget/padding.schema.json": "7314e3b7984b680a8abb908d80053c23",
"assets/packages/schema_widget/assets/schema/widget/page_view.schema.json": "90f638e39b15b6bf5f1fc13256f0fd94",
"assets/packages/schema_widget/assets/schema/widget/place_holder.schema.json": "144d23345f15f82b1761b6ac5f442927",
"assets/packages/schema_widget/assets/schema/widget/positioned.schema.json": "99d68724b896935b085d9c991897977c",
"assets/packages/schema_widget/assets/schema/widget/raised_button.schema.json": "732b9a77b44646543c2c5eb8b0e82a8d",
"assets/packages/schema_widget/assets/schema/widget/row.schema.json": "aa69567c169ba93c60372479bf4ce0b2",
"assets/packages/schema_widget/assets/schema/widget/safe_area.schema.json": "19de58f2711fcfe0b14aed12e553e827",
"assets/packages/schema_widget/assets/schema/widget/scaffold.schema.json": "b370bdd9608861e49d53eb0dc0970f99",
"assets/packages/schema_widget/assets/schema/widget/schema_form_widget.schema.json": "8b20f1e01d547ebf0a1116aa5e62f9f5",
"assets/packages/schema_widget/assets/schema/widget/sized_box.schema.json": "4f28d5444660013abb80ac12b433893f",
"assets/packages/schema_widget/assets/schema/widget/sized_box_default.schema.json": "6a8c901ef0c033f8acb8e29ce23c8be6",
"assets/packages/schema_widget/assets/schema/widget/sized_box_expand.schema.json": "92bb5af8d78d27494d7b499c61e5a3ba",
"assets/packages/schema_widget/assets/schema/widget/sized_box_fromSize.schema.json": "29101fa5ec46c047deefc4046172d3be",
"assets/packages/schema_widget/assets/schema/widget/sized_box_shrink.schema.json": "c8d053596de7aca4294893d36469a140",
"assets/packages/schema_widget/assets/schema/widget/spin_kit_rotating_circle.schema.json": "cba0aa9f125dbc15b8220640707a5213",
"assets/packages/schema_widget/assets/schema/widget/stack.schema.json": "7e7b86b91d3fca771e24e041aa80213e",
"assets/packages/schema_widget/assets/schema/widget/stream_builder_dynamic.schema.json": "3d303e66aefb4bdb2283a711893151b5",
"assets/packages/schema_widget/assets/schema/widget/text.schema.json": "16b032063e76188709466c57433820fa",
"assets/packages/schema_widget/assets/schema/widget/text_default.schema.json": "4584782cfcba402a2f88c124e2692cf5",
"assets/packages/schema_widget/assets/schema/widget/text_rich.schema.json": "c5fe0743640772b0d8b1812b78234569",
"assets/packages/schema_widget/assets/schema/widget/text_schema_form_field_template.schema.json": "95adb201f8b787b0d562dce2e264fccc",
"assets/packages/schema_widget/assets/schema/widget/text_schema_form_field_widget.schema.json": "5b0dbba2013fbc5e6811b92527c968bb",
"assets/packages/schema_widget/assets/schema/widget/wrap.schema.json": "237ffcddd6904ac7a6d3bc0262313d0e",
"assets/packages/schema_widget/assets/schema/widget.schema.json": "d923f17fe27d113fc43d62cd92d09fe3",
"assets/packages/schema_widget/assets/schema/will_pop_callback.schema.json": "02e72941266ff647cde91012f21516e1",
"assets/packages/schema_widget/assets/schema/window_padding.schema.json": "f4935c8c36b851b445d25efba8f2aba2",
"assets/packages/schema_widget/assets/schema/wrap_alignment.schema.json": "54a04100d58f8deb56573e827957997f",
"assets/packages/schema_widget/assets/schema/wrap_cross_alignment.schema.json": "e90126e077bcf8230e061712bbd71f9b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "6f0fcc6326e49ae3760ad7b623a99e69",
"/": "6f0fcc6326e49ae3760ad7b623a99e69",
"main.dart.js": "2a540eec659a21df17db6b20fdae97a4",
"manifest.json": "9e7b34fd7c291ca2523123ef20497930"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    return self.skipWaiting();
  }
  if (event.message === 'downloadOffline') {
    downloadOffline();
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
