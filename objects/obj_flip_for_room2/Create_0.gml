// In a Controller Object (Create Event or Room Start)
var _cam = view_camera[0];
var _view_mat = camera_get_view_mat(_cam);
var _proj_mat = matrix_build_projection_ortho(view_wport[0], view_hport[0], 1, 32000);

// Mirror the X-axis
_proj_mat[0] = -_proj_mat[0]; 

camera_set_proj_mat(_cam, _proj_mat);