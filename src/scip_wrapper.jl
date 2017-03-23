# direct calls to SCIP

"Calls SCIPwriteOrigProblem: writes original problem to file"
function _writeOrigProblem(model::SCIPMathProgModel, filename::Cstring,
                           extension::Cstring, genericnames::Cint)
    ccall((:SCIPwriteOrigProblem, libcsip), Cint,
          (Ptr{Void}, Cstring, Cstring, Cint),
          model.inner.ptr_model, filename, extension, genericnames)
end
