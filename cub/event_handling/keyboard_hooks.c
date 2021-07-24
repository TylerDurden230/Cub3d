/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   keyboard_hooks.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fd-agnes <fd-agnes@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/12 12:42:11 by fd-agnes          #+#    #+#             */
/*   Updated: 2021/04/19 18:18:57 by fd-agnes         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libcub.h"

void	set_key_on(int keycode, t_window *window, int val)
{
	if (keycode == W_CODE)
		window->keys->w_key = val;
	if (keycode == A_CODE)
		window->keys->a_key = val;
	if (keycode == S_CODE)
		window->keys->s_key = val;
	if (keycode == D_CODE)
		window->keys->d_key = val;
	if (keycode == L_A_CODE)
		window->keys->left_arrow = val;
	if (keycode == R_A_CODE)
		window->keys->right_arrow = val;
	if (keycode == SHIFT_CODE)
		window->keys->shift = val;
	if (keycode == ESC_CODE)
		window->keys->esc = val;
}

int	key_hook_in(int keycode, t_window *window)
{
	set_key_on(keycode, window, 1);
	return (0);
}

int	key_hook_out(int keycode, t_window *window)
{
	set_key_on(keycode, window, 0);
	return (0);
}