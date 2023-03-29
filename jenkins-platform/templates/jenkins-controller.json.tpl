[
    {
      "name": "${name}",
      "image": "${container_image}",
      "cpu": ${cpu},
      "memory": ${memory},
      "memoryReservation": ${memory},
      "environment": [
        { "name" : "JAVA_OPTS", "value" : "-Djenkins.install.runSetupWizard=false" },
        { "name" : "ADMIN_PWD", "value" : "admin"}
      ],
      "essential": true,
      "mountPoints": [
        {
          "containerPath": "${jenkins_home}",
          "sourceVolume": "${source_volume}"
        }
      ],
      "portMappings": [
        {
          "containerPort": ${jenkins_controller_port}
        },
        {
          "containerPort": ${jnlp_port}
        }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
            "awslogs-group": "${log_group}",
            "awslogs-region": "${region}",
            "awslogs-stream-prefix": "controller"
        }
      }
    }
]
  