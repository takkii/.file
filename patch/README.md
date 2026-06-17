> "C:/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.2/lib/rbs/environment_loader.rb:26:in '<class:EnvironmentLoader>': undefined method 'Pathname' for class RBS::EnvironmentLoader (NoMethodError)

```markdown
# 差分を生成
diff -u  /mnt/c/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.2/lib/rbs/environment_loader.rb environment_loader.rb > environment_loader.patch

# パッチを適用
patch -u /mnt/c/Users/user/AppData/Local/nvim-data/mason/packages/solargraph/gems/rbs-4.0.2/lib/rbs/environment_loader.rb environment_loader.rb < environment_loader.patch
```

_※ Windows11のWSL2環境でパッチ適用を推奨します。_