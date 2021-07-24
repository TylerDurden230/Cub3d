/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fd-agnes <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/17 13:06:19 by fd-agnes          #+#    #+#             */
/*   Updated: 2021/04/17 13:06:22 by fd-agnes         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libutils.h"

void	*ft_calloc(size_t count, size_t size)
{
	size_t	total_size;
	void	*dst;

	total_size = size * count;
	dst = malloc(total_size);
	if (!dst)
		return (0);
	ft_memset(dst, 0, total_size);
	return (dst);
}
