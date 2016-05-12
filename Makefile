# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: npineau <npineau@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/01/23 12:57:00 by npineau           #+#    #+#              #
#    Updated: 2015/05/21 19:44:01 by npineau          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	:=	scop

### DIRECTORIES ###

DIRSRC	:=	src
DIROBJ	:=	obj
DIRINC	:=	inc
DIRFT	:=	libft
DIRUMLX	:=	libumlx
DIRMLX	:=	minilibx_macos
DIRMTX	:=	libmtx

DIRMAIN		:=	$(DIRSRC)/main
DIRPARSER	:=	$(DIRSRC)/parser
DIRSHAPE	:=	$(DIRSRC)/shapes
DIRRAY		:=	$(DIRSRC)/ray
DIRUTIL		:=	$(DIRSRC)/util

### FILES ###

HEAD := $(DIRINC)/$(NAME).h

include $(DIRMAIN)/sources.mk
#include $(DIRPARSER)/sources.mk
#include $(DIRSHAPE)/sources.mk
#include $(DIRRAY)/sources.mk
#include $(DIRUTIL)/sources.mk

POBJ	:=	$(addprefix $(DIROBJ)/, $(OBJ))

PFT		:= $(DIRFT)/libft.a
PUMLX	:= $(DIRUMLX)/libumlx.a
PMLX	:= $(DIRMLX)/libmlx.a
PMTX	:= $(DIRMTX)/libmtx.a

### COMPILATION VARIABLES ###

CC		:=	clang

C_FLAG	:=	-Wall -Wextra -Werror
O_FLAG	:=	-O3

C_INC	:=	-I $(DIRINC) \
			-I $(DIRFT)/$(DIRINC) \
			-I $(DIRUMLX)/$(DIRINC) \
			-I $(DIRMTX)/$(DIRINC) \
			-I $(DIRMLX)

L_FLAG	:=	-L $(DIRFT) -lft
#L_FLAG	:=	-L $(DIRMTX) -lmtx \
			-L $(DIRUMLX) -lumlx \
			-L $(DIRFT) -lft \
			-L $(DIRMLX) -lmlx \
			-framework OpenGL -framework AppKit \
			-lm

COMPIL	= $(CC) -o $@ -c $< $(C_INC) $(C_FLAG) $(O_FLAG)
LINK	= $(CC) -o $@ $^ $(L_FLAG)


### RULES ###

.PHONY: all clean fclean re

#all: $(PMLX) $(PFT) $(PUMLX) $(PMTX) $(NAME)
all: $(PFT) $(NAME)

$(POBJ): |$(DIROBJ)

$(DIROBJ):
	mkdir $(DIROBJ)

$(NAME): $(POBJ)
	$(LINK)

### LIBS ###

$(PFT):
	make -C $(DIRFT)

$(PUMLX):
	make -C $(DIRUMLX)

$(PMLX):
	make -C $(DIRMLX)

$(PMTX):
	make -C $(DIRMTX)

### MISC ###

clean:
	rm -rf $(DIROBJ)

fclean: clean
	rm -f $(NAME)
	make -C $(DIRFT) fclean
#	make -C $(DIRUMLX) fclean
#	make -C $(DIRMLX) clean
#	make -C $(DIRMTX) fclean

run: all
	./$(NAME)

re: fclean all
