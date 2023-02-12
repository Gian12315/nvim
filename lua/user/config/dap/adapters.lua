local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}
dap.adapters.python = {
  type = 'executable',
  command = '/usr/bin/python',
  args = { '-m', 'debugpy.adapter' },
    console = "integratedTerminal",
    stopOnEntry = true,
}
