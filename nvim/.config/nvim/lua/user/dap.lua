local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.adapters.python = {
    type = 'executable',
    command = ''
}

dap.configurations.python = {
    type = 'python';
    request = 'launch';
    name = 'Launch file';

    program = "${file}";
    pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
        else
            return '/usr/bin/python3'
        end
    end;
}
