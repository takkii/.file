> C:/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.2/lib/rbs/environment_loader.rb:26:in '<class:EnvironmentLoader>': 
>
> undefined method 'Pathname' for class RBS::EnvironmentLoader (NoMethodError)

```markdown
# パッチを生成
diff -u  /mnt/c/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.2/lib/rbs/environment_loader.rb environment_loader.rb > environment_loader.patch

# パッチを適用① (rbs-4.0.2)
patch -u /mnt/c/Users/sudok/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.2/lib/rbs/environment_loader.rb < environment_loader.patch

# パッチを適用② (rbs-4.0.3)
patch -u /mnt/c/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.3/lib/rbs/environment_loader.rb < environment_loader.patch

# パッチを適用③ (Ubuntu/rbs-4.0.3)
patch -u ~/.local/share/nvim/mason/packages/solargraph/gems/rbs-4.0.3/lib/rbs/environment_loader.rb < environment_loader.patch
```

_※ Windows11のWSL2環境でパッチ適用を推奨します。_

更新履歴: 2026/06/19🔄
