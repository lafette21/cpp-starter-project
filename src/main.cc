#include <fmt/format.h>

#include <cstdlib>

int main([[maybe_unused]] int argc, [[maybe_unused]] char *argv[])
{
    fmt::print("Example {}", "project");

    return EXIT_SUCCESS;
}
