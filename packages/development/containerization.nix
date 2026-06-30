{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    dive
    # Dropped (Linux-only): podman
  ];
}
