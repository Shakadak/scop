#include "libft.h"

void	printelem(t_list *elem) {
	ft_putendl(elem->content); }

int	main(void)
{
	t_list	*h = split_when(ft_isspace, "this is a test string");
	ft_putendl("--------");
	ft_lstiter(h, printelem);
	ft_putendl("--------");
	t_list	*i = split_when(ft_isspace, "What the hell is going on ?");
	ft_putendl("--------");
	ft_lstiter(i, printelem);
	ft_putendl("--------");
	return (0);
}
