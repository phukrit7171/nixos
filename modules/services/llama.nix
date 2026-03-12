{
  pkgs,
  inputs,
  ...
}:

{
  systemd.services.llama-server = {
    description = "Llama.cpp Server";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${inputs.llama-cpp.packages.${pkgs.stdenv.hostPlatform.system}.cuda}/bin/llama-server -m /home/phukrit7171/Development/llms/Qwen3.5-9B-UD-Q4_K_XL.gguf -ngl 99 -fa on -c 32768 --cache-type-k q4_0 --cache-type-v q4_0 -b 4096 -ub 1024 --port 8080";
      Restart = "on-failure";
      RestartSec = "10s";
      User = "phukrit7171";
    };
  };
}
