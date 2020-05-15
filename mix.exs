defmodule LY11SystemRpi4.MixProject do
  use Mix.Project

  @github_organization "bcdevices"
  @app :ly11_system_rpi4
  @version Path.join(__DIR__, "VERSION")
           |> File.read!()
           |> String.trim()

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.6",
      compilers: Mix.compilers() ++ [:nerves_package],
      nerves_package: nerves_package(),
      description: description(),
      package: package(),
      deps: deps(),
      aliases: [loadconfig: [&bootstrap/1], docs: ["docs", &copy_images/1]],
      docs: [extras: ["README.md"], main: "readme"]
    ]
  end

  def application do
    []
  end

  defp bootstrap(args) do
    set_target()
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  defp nerves_package do
    [
      type: :system,
      artifact_sites: [
        {:github_releases, "#{@github_organization}/#{@app}"},
        {:prefix, "https://ly-archive.iotcloud.io/"}
      ],
      build_runner_opts: build_runner_opts(),
      platform: Nerves.System.BR,
      platform_config: [
        defconfig: "nerves_defconfig"
      ],
      checksum: package_files()
    ]
  end

  defp deps do
    [
      {:nerves, "~> 1.5.4 or ~> 1.6.0", runtime: false},
      {:nerves_system_br, "1.11.3", runtime: false},
      {:nerves_toolchain_arm_unknown_linux_gnueabihf, "~> 1.3.0", runtime: false},
      {:nerves_system_linter, "~> 0.3.0", runtime: false},
      {:ex_doc, "~> 0.18", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    """
    LY11 Nerves System - Raspberry Pi 4
    """
  end

  defp package do
    [
      maintainers: ["Blue Clover Devices"],
      files: package_files(),
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/#{@github_organization}/#{@app}"}
    ]
  end

  defp package_files do
    [
      "package",
      "external.mk",
      "fwup_include",
      "rootfs_overlay",
      "CHANGELOG.md",
      "cmdline.txt",
      "config.txt",
      "fwup-revert.conf",
      "fwup.conf",
      "LICENSE",
      "linux-4.19.defconfig",
      "mix.exs",
      "patches",
      "busybox_defconfig",
      "nerves_defconfig",
      "post-build.sh",
      "post-createfs.sh",
      "ramoops.dts",
      "users_table.txt",
      "README.md",
      "VERSION"
    ]
  end

  # Copy the images referenced by docs, since ex_doc doesn't do this.
  defp copy_images(_) do
    File.cp_r("assets", "doc/assets")
  end

  defp build_runner_opts() do
    if primary_site = System.get_env("BR2_PRIMARY_SITE") do
      [make_args: ["BR2_PRIMARY_SITE=#{primary_site}"]]
    else
      []
    end
  end

  defp set_target() do
    if function_exported?(Mix, :target, 1) do
      apply(Mix, :target, [:target])
    else
      System.put_env("MIX_TARGET", "ly11_rpi4")
    end
  end
end
