-- Run current Python file in LazyVim's existing Snacks terminal
vim.keymap.set("n", "<F5>", function()
  -- Save current file
  vim.cmd("write")

  local cwd = vim.fn.getcwd()
  local file = vim.fn.expand("%:p")

  -- Find the same terminal used by Ctrl+/
  local term = Snacks.terminal.get(nil, { cwd = cwd })

  if not term then
    vim.notify("Cannot find Snacks terminal", vim.log.levels.ERROR)
    return
  end

  -- Show and focus the existing terminal
  term:show():focus()

  local buf = term.buf
  local job = vim.b[buf].terminal_job_id

  if not job or job <= 0 then
    vim.notify("Terminal is not running", vim.log.levels.ERROR)
    return
  end

  -- Use project virtual environment if available
  local python = cwd .. "/.venv/Scripts/python.exe"

  if vim.fn.executable(python) ~= 1 then
    python = "python"
  end

  -- Build command according to the current shell
  local shell = vim.o.shell:lower()
  local command

  if shell:match("powershell") or shell:match("pwsh") then
    local function quote(s)
      return "'" .. s:gsub("'", "''") .. "'"
    end

    command = "& " .. quote(python) .. " " .. quote(file)
  else
    command = '"' .. python .. '" "' .. file .. '"'
  end

  -- Send command to the existing terminal
  vim.fn.chansend(job, command .. "\r")
end, { desc = "Run Python File" })
