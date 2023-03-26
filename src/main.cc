#include <fmt/format.h>

#include <iostream>

int main(int argc, [[maybe_unused]] char *argv[])
{
    std::puts(fmt::format("Example {}", "project").c_str());

    return 0;
}
