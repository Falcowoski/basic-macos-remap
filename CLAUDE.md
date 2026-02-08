# Instruções para Claude Code

## Arquitetura do Karabiner-Elements

O Karabiner-Elements usa dois lugares para regras:

1. **Regras disponíveis**: `~/.config/karabiner/assets/complex_modifications/*.json`
   - Arquivos gerados pelo `make install`
   - Ficam disponíveis para serem adicionadas no GUI

2. **Regras ativas**: `~/.config/karabiner/karabiner.json`
   - Configuração principal com as regras em uso
   - Quando você "adiciona uma regra" no GUI, ela é copiada para cá

## ⚠️ IMPORTANTE: Após modificar regras

Quando você modificar arquivos em `src/*.jsonnet` e executar `make install`:

1. As regras **disponíveis** são atualizadas
2. As regras **ativas** NÃO são atualizadas automaticamente

**Você DEVE fazer manualmente:**

1. Abrir o Karabiner-Elements
2. Ir em "Complex Modifications"
3. **Remover** a regra modificada (botão "Remove")
4. Clicar em "Add predefined rule"
5. **Adicionar** novamente a regra atualizada

Isso substitui a regra antiga pela nova versão.

## Workflow de desenvolvimento

```bash
# 1. Editar configuração
vim src/windows-shortcuts.jsonnet

# 2. Compilar e instalar
make install

# 3. LEMBRAR: remover e adicionar novamente a regra no GUI do Karabiner!
```

## Estrutura do projeto

- `config.jsonnet` - Configuração do teclado externo (vendor_id, product_id)
- `src/windows-shortcuts.jsonnet` - Remaps de atalhos Windows/Linux → macOS
- `src/abnt2-vowels.jsonnet` - Suporte a acentuação ABNT2
- `src/caps-lock-fast.jsonnet` - Caps Lock otimizado para digitação rápida
- `dist/*.json` - Arquivos compilados (gerados pelo make)

## Lista de terminais

A lista de terminais em `src/windows-shortcuts.jsonnet` controla quais apps não devem receber certos remaps (como Ctrl+C, Ctrl+A, etc.):

```jsonnet
local terminals = [
  '^com\\.apple\\.Terminal$',
  '^com\\.googlecode\\.iterm2$',
  '^co\\.zeit\\.hyper$',
  '^io\\.alacritty$',
  '^net\\.kovidgoyal\\.kitty$',
  '^org\\.alacritty$',
  '^com\\.github\\.wez\\.wezterm$',
  '^dev\\.zed\\.Zed$',
];
```

Se precisar adicionar um novo terminal, adicione o bundle identifier nessa lista.
