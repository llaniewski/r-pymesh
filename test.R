library(reticulate)
use_python("/usr/local/bin/python")
pymesh = import("pymesh")

calc_sp = function(tab, filename) {
    for (i in seq_len(nrow(tab))) {
        sp = pymesh$generate_icosphere(tab$r[i], c(tab$x[i],tab$y[i],tab$z[i]), 4L)
        if (i == 1) {
            mesh = sp
        } else {
            mesh = pymesh$boolean(mesh, sp, "union")
        }
    }
    if (!missing(filename)) pymesh$meshio$save_mesh(filename, mesh, ascii=FALSE)
    mesh$add_attribute("face_area")
    list( area=sum(mesh$get_attribute("face_area")), volume=mesh$volume )
}

tab = data.frame(r=c(1,1,1),x=c(0,1,0),y=c(0,0,1),z=c(0,0,0))
calc_sp(tab)


