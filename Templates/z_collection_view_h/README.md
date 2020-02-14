# Generamba Templates
Generamba templates collection.

## Installation
1) Install and setup [`Generamba`](https://github.com/rambler-digital-solutions/Generamba)

2) Update templates section in your `Rambafile`:
```
### Templates
catalogs:
- 'https://github.com/SergLam/Generamba-Templates'

templates:
- {name: z_swifty_viper, git: 'https://github.com/SergLam/Generamba-Templates', branch: 'master'}

- {name: z_table_view, git: 'https://github.com/SergLam/Generamba-Templates', branch: 'master'}
- {name: z_collection_view_h, git: 'https://github.com/SergLam/Generamba-Templates', branch: 'master'}
- {name: z_collection_view_v, git: 'https://github.com/SergLam/Generamba-Templates', branch: 'master'}

- {name: z_table_view_controller_mvvm, git: 'https://github.com/SergLam/Generamba-Templates', branch: 'master'}
- {name: z_photo_selection, git: 'https://github.com/SergLam/Generamba-Templates', branch: 'master'}
- {name: z_slide_nav_vc, git: 'https://github.com/SergLam/Generamba-Templates', branch: 'master'}
```

3) Run `generamba template install`. All the templates will be placed in the '/Templates' folder of your current project.

3) Run `generamba gen [MODULE_NAME] [TEMPLATE_NAME]` - It creates module with specific name from specific template.

### Additional info

Run `generamba help` to learn more about each of the Generamba features.

**Wiki:**
- [Command list](https://github.com/rambler-digital-solutions/Generamba/wiki/Available-Commands)
- [Understanding the Rambafile](https://github.com/rambler-digital-solutions/Generamba/wiki/Rambafile-Structure)
- [Understanding templates](https://github.com/rambler-digital-solutions/Generamba/wiki/Template-Structure)

**Other materials:**
- [Russian] Rambler.iOS V: Generamba and Code Generation ([Slides](http://www.slideshare.net/Rambler-iOS/viper-56423582) | [Video](http://www.youtube.com/watch?v=NXNiN9FaUnY))
- [Introduction to Generamba](http://etolstoy.com/2016/02/10/generamba/)
