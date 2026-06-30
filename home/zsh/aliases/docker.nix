{
  programs.zsh.shellAliases = {
    # --- Docker Core ---
    d = "docker";
    di = "docker images";
    dprune = "docker system prune -a --volumes";
    dps = "docker ps";
    dpsa = "docker ps -a";
    drm = "docker rm";
    drmi = "docker rmi";

    # --- Docker Compose ---
    dc = "docker compose";
    dcb = "docker compose build";
    dcd = "docker compose down";
    dcdsd = "docker compose down; sudo shutdown now"; # Your custom command
    dcp = "docker compose pull";
    dcr = "docker compose restart";
    dcu = "docker compose up";
    dlogs = "docker compose logs -f";

    # --- Podman (Your original aliases) ---
    podimg = "podman images";
    podnames = "podimg | awk 'match(\$1, /\w+$/) {print substr(\$1, RSTART, RLENGTH)}'";
    podtags = "podimg | awk '{print \$2}'";

    # --- Handy Docker Shell Helper ---
    # Usage: dbash <container_name>
    dbash = "dexec_bash() { docker exec -it $1 bash; }; dexec_bash";
  };
}
