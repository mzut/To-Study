c.NotebookApp.allow_remote_access = True
c.NotebookApp.ip = '*'
c.NotebookApp.notebook_dir = '/home/[用户名]'
c.NotebookApp.open_browser = False
c.NotebookApp.password = u'sha1:164bb3579420:ceec37ade6e070f0d2201092c071adcfddeb2bea'
c.NotebookApp.port = 8888


# http://imshuai.com/jupyter-notebook-introduction-configuration/
# c.NotebookApp.allow_remote_access = True 允许远程连接

# 生成密码
# python -c 'from notebook.auth import passwd;print(passwd())'