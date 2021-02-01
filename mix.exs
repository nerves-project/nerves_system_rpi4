defmodule LY11SystemRpi4.MixProject do
  use Mix.Project

  @github_organization "bcdevices"
  @app :ly11_system_rpi4
  @source_url "https://github.com/#{@github_organization}/#{@app}"
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
      docs: docs(),
      preferred_cli_env: %{
        docs: :docs,
        "hex.build": :docs,
        "hex.publish": :docs
      }
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
      {:nerves, "~> 1.5.4 or ~> 1.6.0 or ~> 1.7.1", runtime: false},
      {:nerves_system_br, "1.14.0", runtime: false},
      {:nerves_toolchain_aarch64_unknown_linux_gnu, "~> 1.3.0", runtime: false},
      {:nerves_system_linter, "~> 0.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.22", only: :docs, runtime: false}
    ]
  end

  defp description do
    """
    LY11 Nerves System - Raspberry Pi 4
    """
  end

  defp docs do
    [
      extras: ["README.md", "CHANGELOG.md"],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"]
    ]
  end

  defp package do
    [
      maintainers: ["Blue Clover Devices"],
      files: package_files(),
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @source_url}
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
      "linux-5.4.defconfig",
      "linux_additional.defconfig",
      "mix.exs",
      "mix.lock",
      "patches",
      "busybox_defconfig",
      "boot.cmd",
      "nerves_defconfig",
      "post-build.sh",
      "post-createfs.sh",
      "post-build-symlinks.sh",
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
    case System.get_env("BR2_PRIMARY_SITE") do
      nil -> []
      primary_site -> [make_args: ["BR2_PRIMARY_SITE=#{primary_site}"]]
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
