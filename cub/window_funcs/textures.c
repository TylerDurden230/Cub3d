/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   textures.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fd-agnes <fd-agnes@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/17 12:56:19 by fd-agnes          #+#    #+#             */
/*   Updated: 2021/04/19 16:10:00 by fd-agnes         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libcub.h"

void	texture_filler(t_texture *texture, t_window *window, char *text_name)
{
	texture->img = mlx_xpm_file_to_image(window->mlx, text_name,
			&texture->img_w, &texture->img_h);
	texture->addr = (int *)mlx_get_data_addr(texture->img,
			&texture->bits_per_pixel, &texture->line_length, &texture->endian);
}

void	textures_filler(t_window *window)
{
	t_game	*game;

	game = window->game;
	texture_filler(window->textuures->n_texture, window, game->no_texture);
	texture_filler(window->textuures->s_textture, window, game->so_texture);
	texture_filler(window->textuures->w_texture, window, game->we_texture);
	texture_filler(window->textuures->e_texture, window, game->ea_texture);
	texture_filler(window->textuures->sprite_texture, window, \
					game->sprite_texture);
	if (window->game->skybox)
		texture_filler(window->textuures->skybox, window, game->skybox);
}
