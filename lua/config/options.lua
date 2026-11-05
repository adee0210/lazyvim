vim.opt.number = true -- hiển thị số dòng
vim.opt.relativenumber = false -- không hiển thị số dòng tương đối
vim.opt.wrap = false -- hiển thị dòng văn bản như một dòng duy nhất
vim.opt.backup = false -- vô hiệu hóa việc tạo file sao lưu
vim.opt.writebackup = false -- ngăn chặn việc chỉnh sửa các file đang được chỉnh sửa ở nơi khác
vim.opt.swapfile = false -- Tắt tính năng tạo file swap

if vim.fn.has("win32") == 1 then
  vim.o.shell = "pwsh.exe"
  vim.o.shellcmdflag = "-NoLogo"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end
