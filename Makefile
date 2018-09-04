# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Makefile                                         .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: jmonneri <marvin@le-101.fr>                +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/08/09 18:13:46 by jmonneri     #+#   ##    ##    #+#        #
#    Updated: 2018/09/03 18:59:12 by jmonneri    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

.PHONY: all clean fclean re signature
NAME = corewar

CC = clang -g
CFLAGS += -Wall -Wextra -Werror

LFTDIR = libft
ASM_DIR = compiler
VM_DIR = vm
H_FILE = op.h

# **************************************************************************** #
#                                    PLAYERS                                   #
# **************************************************************************** #

PATH_COR = ./script/cor/
PATH_S = ./vm_champs/
P1 = aurollan.cor
P2 = aurollan.cor

# **************************************************************************** #
#                                    RULES                                     #
# **************************************************************************** #

all: $(NAME)

$(NAME): build_asm build_corewar
	@echo "$(NAME) ready, enjoy!"

build_corewar:
	@make -C $(VM_DIR)
	@cp $(VM_DIR)/corewar .

build_asm:
	@make -C $(ASM_DIR)
	@cp $(ASM_DIR)/asm .

clean:
	@make -C $(ASM_DIR) clean
	@make -C $(VM_DIR) clean

fclean:
	@make -C $(ASM_DIR) fclean
	@make -C $(VM_DIR) fclean
	@touch asm corewar
	@rm asm corewar

re: fclean all

# **************************************************************************** #
#                                    UTILS                                     #
# **************************************************************************** #

valgrind_vm: build_corewar
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./corewar $(addprefix $(PATH_COR), $(P1) $(P2) $(P3) $(P4))
	rm -rf corewar.dSYM

valgrind_asm: build_asm
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./asm  $(addprefix $(PATH_S), $(P1) $(P2) $(P3) $(P4))
	rm -rf asm.dSYM

coffee:
	@echo "                       ."
	@echo "                        `:."
	@echo "                          `:."
	@echo "                  .:'     ,::"
	@echo "                 .:'      ;:'"
	@echo "                 ::      ;:'"
	@echo "                  :    .:'"
	@echo "                   `.  :."
	@echo "          _________________________"
	@echo "         : _ _ _ _ _ _ _ _ _ _ _ _ :"
	@echo "     ,---:\".\".\".\".\".\".\".\".\".\".\".\".\":"
	@echo "    : ,'\"`::.:.:.:.:.:.:.:.:.:.:.::'"
	@echo "    `.`.  `:-===-===-===-===-===-:'"
	@echo "      `.`-._:                   :"
	@echo "       `-.__`.               ,'"
	@echo "    ,--------`\"`-------------'--------."
	@echo "     `\"--.__                   __.--\"'"
	@echo "             `\"\"-------------\"\"'""