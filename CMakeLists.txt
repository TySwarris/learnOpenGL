cmake_minimum_required(VERSION 3.20)

project(LearnOpenGL LANGUAGES C CXX)   # <-- enable C as well as C++
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(OpenGL REQUIRED)
find_package(PkgConfig REQUIRED)
pkg_check_modules(GLFW REQUIRED glfw3)

# GLAD 1.x
set(GLAD_SRC libs/glad/src/glad.c)     # <-- make sure this file exists
set(GLAD_INC libs/glad/include)

function(add_example name)
  add_executable(${name} src/${name}.cpp ${GLAD_SRC})
  target_include_directories(${name} PRIVATE ${GLAD_INC} ${GLFW_INCLUDE_DIRS} src)
  target_compile_definitions(${name} PRIVATE GLFW_INCLUDE_NONE)
  target_link_libraries(${name} PRIVATE ${GLFW_LIBRARIES} OpenGL::GL dl)
  set_target_properties(${name} PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")
endfunction()

# --- Custom clean target -------------------------------------------------------
add_custom_target(clean-all
  COMMAND ${CMAKE_COMMAND} -E rm -rf ${CMAKE_BINARY_DIR}/*
  COMMENT "Removing all build files..."
)

add_example(helloWindow)


add_example(helloTriangle)
add_example(helloShader)
# add_example(textures)
# add_example(transformations)

