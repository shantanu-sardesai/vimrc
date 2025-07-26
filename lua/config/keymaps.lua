local map = vim.keymap.set

-- general nvim

map("n", "<leader>pv", vim.cmd.Ex) -- file explorer (netrw).

-- to move the selection up or down.
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- appending the following lines while keeping the cursor where it was.
map("n", "J", "mzJ`z")

-- jump half page up or down while keeping the cursor in the centre.
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- keep search terms in the middle.
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- preserves the previously copied value, watch the theprimeagen video on LSP setup for more context.
map("x", "<leader>p", [["_dP]])

-- disable since I no longer use the vim clipboard.
-- -- copy to system clipboard.
-- map({ "n", "v" }, "<leader>y", [["+y]])
-- map("n", "<leader>Y", [["+Y]])

-- delete related keybinding for void register.
map({ "n", "v" }, "<leader>d", '"_d')

map("n", "Q", "<nop>")

-- kept it to keep in mind more interesting things possible via nvim.
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- replace the highlighted word.
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
