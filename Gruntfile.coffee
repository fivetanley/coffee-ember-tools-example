module.exports = (grunt) ->

  externalTasks = [
    'grunt-contrib-coffee'
    'grunt-shell'
    'grunt-contrib-watch'
    'grunt-contrib-connect'
  ]

  grunt.loadNpmTasks task for task in externalTasks

  grunt.initConfig
    coffee:
      default:
        expand: true
        cwd: __dirname
        src: 'coffee/**/*.coffee'
        dest: 'js/'
        ext: '.js'

    watch:
      coffee:
        files: [ 'coffee/**/*.coffee' ]
        tasks: [ 'coffee' ]

      ember:
        files: [ 'js/**/*.js', '!js/application/js', '!js/index.js', '!js/templates.js' ]
        tasks: [ 'shell:ember' ]

    shell:
      ember:
        command: 'ember build'

    connect:
      server:
        options:
          port: 9001
          base: __dirname

  grunt.registerTask 'default', [ 'connect:server', 'watch' ]

