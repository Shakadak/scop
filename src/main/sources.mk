MAIN	:= main.c

OBJ := $(OBJ) $(MAIN:.c=.o)

$(DIROBJ)/%.o: $(DIRMAIN)/%.c $(INC)
	$(COMPIL)
