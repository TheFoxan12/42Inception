# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tunsinge <thibaut.unsinger@gmail.com>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/23 12:15:08 by tunsinge          #+#    #+#              #
#    Updated: 2023/09/23 12:15:08 by tunsinge         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

start:
	@mkdir -p /home/login/data/mariadb
	@mkdir -p /home/login/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d --build

stop:
	@docker compose -f ./srcs/docker-compose.yml down

clean: stop
	@rm -rf /home/login/data/mariadb
	@rm -rf /home/login/data/wordpress
	@docker system prune -f
	@docker image prune -af
	@docker volume rm srcs_wordpress
	@docker volume rm srcs_mariadb
