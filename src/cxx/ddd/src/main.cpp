#include "gtest/gtest.h"


int main(int argsN, char** args)
{
    ::testing::InitGoogleTest(&argsN, args);
    return RUN_ALL_TESTS();
}
