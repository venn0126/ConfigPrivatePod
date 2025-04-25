# ConfigPrivatePod

## 使用说明

* 首先新建仓库(`repo`),这个仓库就是我们需要的组件所在的库
* 执行命令`pod repo add [仓库名] [仓库的地址]`
* 然后在总的目录下,新建私有库`Xcode`工程`~/Documents/XXXHub/A`,假设A就是这个新建的工程
* 下载ConfigPrivatePod到和A的目录平级,然后cd到`~/Documents/XXXHub/ConfigPrivatePod/templates/`,修改`Podfile`文件,将`http://gitlab.mrd.sohuno.com/haixuwu/pnmediator.git`修改为新建的`A`的仓库地址
* 完成后去`~/Documents/XXXHub/ConfigPrivatePod/`目录下,执行脚本`./config.sh`
* 然后更新`A.podspec`文件中的信息，在当前目录执行`pod update --no-repo-update 验证`
* 然后执行`./upload.sh`即可(该脚本中的信息自由修改尤其是`main/master`不同)
