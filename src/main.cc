#include <iostream>

#include <fmt/core.h>

int main([[maybe_unused]] int argc, [[maybe_unused]] char *argv[])
{
    std::cout << fmt::format("Example {}", "project") << std::endl;

    return 0;
}
