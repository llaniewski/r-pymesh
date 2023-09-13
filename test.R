library(reticulate)
use_python("/usr/local/bin/python")
pymesh = import("pymesh")
sp = pymesh$generate_icosphere(1, c(0,0,0), 4L)
mesh = sp
sp = pymesh$generate_icosphere(1, c(1,0,0), 4L)
mesh = pymesh$boolean(mesh, sp, "union")
sp = pymesh$generate_icosphere(1, c(1,0,0), 4L)
mesh = pymesh$boolean(mesh, sp, "union")
pymesh$meshio$save_mesh("mesh.stl", mesh, ascii=FALSE)
mesh$add_attribute("face_area")
print(sum(mesh$get_attribute("face_area")))
print(mesh$volume)

