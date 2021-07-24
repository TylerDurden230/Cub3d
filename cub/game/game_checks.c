/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   game_checks.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fd-agnes <fd-agnes@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/12 12:46:08 by fd-agnes          #+#    #+#             */
/*   Updated: 2021/04/22 16:39:34 by fd-agnes         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libcub.h"
#include <stdio.h>

int	is_color_filled(t_color *color)
{
	int	r;

	r = 0;
	if (color->red && color->green && color->blue)
	{
		if (ft_atoi(color->red) > 255)
			return (0);
		if (ft_atoi(color->green) > 255)
			return (0);
		if (ft_atoi(color->blue) > 255)
			return (0);
		r = ft_atoi(color->red);
		color->n_color = (((r & 0xff) << 16) + \
			(((ft_atoi(color->blue) & 0xff) << 8) \
			 + ((ft_atoi(color->green) & 0xff))));
		return (1);
	}
	return (0);
}

int	is_map_moment(t_game *game)
{
	if (game->res_h && game->res_w
		&& game->no_texture && game->so_texture
		&& game->we_texture && game->ea_texture
		&& game->sprite_texture
		&& is_color_filled(game->fcolor))
	{
		if (is_color_filled(game->ccolr))
			return (1);
		else
		{
			printf("Manca il colore\n");
			return (0);
		}
	}
	return (0);
}

int	is_texture_valid(char *text_name)
{
	if (check_suffix(text_name, ".xpm"))
	{
		if (open((const char *)text_name, 0) >= 0)
		{
			close(*text_name);
			return (1);
		}
	}
	printf("Error\ntexture %s not valid\n", text_name);
	return (0);
}

int	validator(t_game *game)
{
	if (is_texture_valid(game->no_texture))
	{
		if (is_texture_valid(game->so_texture))
		{
			if (is_texture_valid(game->we_texture))
			{
				if (is_texture_valid(game->ea_texture))
				{
					if (is_texture_valid(game->sprite_texture))
						return (1);
					else
						return (0);
				}
			}
		}
	}
	return (0);
}

int	are_game_ok(t_game *game)
{
	if (is_map_moment(game)
		&& is_map_valid(game->map)
		&& validator(game))
	{
		mat_size(game);
		return (1);
	}
	return (0);
}
