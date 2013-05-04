CppProGen
=========

Aoto generate cpp test project

Your computer should installed ruby and cmake; 
This will help you auto generate a cpp project with the test fold and script;
The project will use Cmake as the build tool and commend to use gtest for unittest;
You should put your source codes and test codes in the corresponding folder; For unittest
we commend gtest that you should put the header files of gtest in the '/test/tools/include' 
and put the gtest lib file in the '/test/tools/lib'.


========

Usage:

ruby pro_gen.rb project_name project_path

parameters:

project_name:  the name of cpp project；

project_path:  the path of the project, should be a existing path；

