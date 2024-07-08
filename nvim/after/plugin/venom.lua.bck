require("venom").setup({
  echo = true,
  symbol = '🐍',
  venv_patterns = { 'venv', '.venv', '.python-version' },
  use_tools = true,
  tools = {
    pipenv = { 'pipenv', '--venv' },
    poetry = { 'poetry', 'env', 'info', '-p' },
  },
  plugins = {
    pyright = function(venv_path)
      return {
        python = {
          pythonPath = table.concat({ venv_path, 'bin', 'python' }, '/')
        },
      }
    end,
    pylsp = function(venv_path)
      return {
        pylsp = {
          plugins = { jedi = { environment = venv_path } }
        },
      }
    end,
  },
})
