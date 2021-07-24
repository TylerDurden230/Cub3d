# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fd-agnes <fd-agnes@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/22 14:19:58 by fd-agnes          #+#    #+#              #
#    Updated: 2021/04/22 15:38:38 by fd-agnes         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLOR_OFF   = "\033[0m"       # Text Reset
GREEN       = "\033[0;32m"        # Green
WHITE       = "\033[0;37m"        # White

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒ Makefile ▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░                                                                                                      ░
#░   ▒▒▒▒▒▒███████████                     ▒███████▀ ▒██        ▄█████▄   ▒██      ▒██                  ░
#░   ▒▒▒▒▒▒███████████                     ▒██       ▒██       ▒██   ▒██  ▒██      ▒██                  ░
#░   ▒▒▒▒▒▒███CUB3D███  Made with HATE by  ▒█████▀   ▒██       ▒██   ▒██  ▒██      ▒██  A.K.A. fd-agnes ░
#░   ▒▒▒▒▒▒███████████                     ▒██       ▒██       ▒██   ▒██  ▒██  ▒██ ▒██                  ░
#░   ▒▒▒▒▒▒███████████                     ▒██       ▒███████   ▀█████▀    ▀███▀ ▀███▀                  ░
#░                                                                                                      ░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒ Makefile ▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
#░                                                                       ░
#░   ▒▒▒▒▒▒███████████     ▒██     ▒██  ▒██   ▒██  ▒██  ▒██  ▒████████   ░
#░   ▒▒▒▒▒▒███████████     ▒██     ▒██  ▒██   ▒██  ▒██  ▒██  ▒██   ▒██   ░
#░   ▒▒▒▒▒▒███CUB3D███     ▒██     ▒██  ▒████████  ▒███████   ▀█  ▒██    ░
#░   ▒▒▒▒▒▒███████████     ▒██ ▒██ ▒██  ▒██   ▒██    ▒██         ▒██     ░
#░   ▒▒▒▒▒▒███████████     ▀███▀ ▀███▀  ▒██   ▒██    ▒██         ▒██     ░
#░ 																         ░
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒░

NAME = libcub.a

CC = gcc

CFLAGS = -Wall -Wextra -Werror -c

CMLXFLAGS = -Werror -Wextra -Wall -lmlx -framework OpenGL -framework AppKit

AR = ar -rc

RAN = ranlib

SEPARATOR = "---------------------------------------------------------------"

CUB_DIR = cub/

CUB_SRCS =	event_handling/mouse_hooks.c \
			event_handling/keyboard_hooks.c \
			game/game_reader.c \
			game/game_utilities.c \
			game/game_checks.c \
			game/sprite_utils.c \
			map/map_filler.c \
			map/map_checker.c \
			map/map_checker_utils.c \
			player/player_checker.c \
			player/player_move.c \
			save/save.c \
			raycast/raycast.c\
			raycast/raycast1.c \
			raycast/raycast2.c \
			raycast/spritecast.c \
			raycast/spritecast1.c \
			struct_manager/struct_init.c\
			struct_manager/struct_init1.c\
			utils/string_utils.c \
			utils/gen_utils.c \
			window_funcs/textures.c \
			window_funcs/win_fxns.c \

LIBUTILS_DIR = libutils/

LIBUTILS_SRCS = ft_atoi.c \
			ft_bzero.c \
			ft_calloc.c \
			ft_isdigit.c \
			ft_memset.c \
			ft_memcpy.c \
			ft_strchr.c \
			ft_strdup.c \
			ft_strjoin.c \
			ft_strcpy.c \
			ft_strlcpy.c \
			ft_strlen.c \
			ft_substr.c \
			ft_get_next_line.c

BNS_DIR = cub/bonus/

BNS_SRCS = 	mini_map.c \
			player_mov_bonus.c \
			mouse_rotation.c

CUB_DIRSRCS = $(addprefix ${CUB_DIR}, ${CUB_SRCS})

BNS_DIRSRCS = $(addprefix ${BNS_DIR}, ${BNS_SRCS})

OBJS = ${CUB_DIRSRCS:.c=.o}

LIBUTILS_DIRSRCS = $(addprefix ${LIBUTILS_DIR}, ${LIBUTILS_SRCS})

LIBUTILS_OBJS = ${LIBUTILS_DIRSRCS:.c=.o}

BNS_OBJS = $(BNS_DIRSRCS:.c=.o)

all: ${NAME}

$(NAME): ${OBJS} ${LIBUTILS_OBJS}
	@${AR} ${NAME} ${OBJS} ${LIBUTILS_OBJS}
	@${RAN} ${NAME}
	@mv ${NAME} cub
	@make -C cub/minilibx
	@cp cub/minilibx/libmlx.dylib .
	@${CC} ${CMLXFLAGS} ./cub/${NAME} cub/main.c libmlx.dylib -o cub3D
	@sed -n 16,26p Makefile;
	@say Good Luck!

norme:
	@sed -n 26,36p Makefile;
	@say Really?
	@echo _Norminette_
	@norminette ./cub/*.c
	@norminette ./cub/game/*.c
	@norminette ./cub/map/*.c
	@norminette ./cub/event_handling/*.c
	@norminette ./cub/player/*.c
	@norminette ./cub/save/*.c
	@norminette ./cub/raycast/*.c
	@norminette ./cub/utils/*.c
	@norminette ./cub/struct_manager/*.c
	@norminette ./cub/window_funcs/*.c
	@echo
	@echo Vollleeeevi! Tutto a norma.

clean:
	@${RM} ${OBJS} $(BNS_OBJS) ${LIBUTILS_OBJS}
	@make clean -C cub/minilibx

fclean: clean
	@say Remove this shit!
	@${RM} ./cub/${NAME}
	@${RM} libmlx.dylib
	@${RM} cub3d

re: fclean all

.PHONY: all bonus clean fclean re
