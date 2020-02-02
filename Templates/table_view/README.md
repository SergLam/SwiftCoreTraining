# Generamba Templates
Generamba templates collection.

## Installation
1) Install and setup [`Generamba`](https://github.com/rambler-digital-solutions/Generamba)

2) Update templates section in your `Rambafile`:
```
### Templates
catalogs:
- 'https://github.com/agsarkisov/generamba-templates'
templates:
- {name: [TEMPLATE_NAME]}
```

3) Run `generamba template install`. All the templates will be placed in the '/Templates' folder of your current project.

3) Run `generamba gen [MODULE_NAME] [TEMPLATE_NAME]` - It creates module with specific name from specific template.

# Installation : 
1. Install and setup Generamba

2. Update templates section in your Rambafile:

```
### Templates
catalogs:
- 'https://github.com/elbertvaldian/Newbie-Viper-Generamba-Template'
templates:
- {name: Newbie-Viper-Generamba-Template}
```

3. Run ```generamba template install```. All the templates will be placed in the '/Templates' folder of your current project.

4. Run ```generamba gen [MODULE_NAME] Newbie-Viper-Generamba-Template``` - It creates module with specific name from specific template.

### Overview

It's a shared catalog of templates for [Generamba](https://github.com/rambler-digital-solutions/Generamba) code generator.

**Generamba** is a code generator made for working with Xcode. Primarily it is designed to generate VIPER modules but it is quite easy to customize it for generation of any other classes (both in Objective-C and Swift).

The detailed information about a template structure is available in [Generamba Wiki](https://github.com/rambler-digital-solutions/Generamba/wiki/Template-Structure).

### Templates
- [adkrviper_controller](https://github.com/rambler-digital-solutions/generamba-catalog/blob/master/adkrviper_controller/adkrviper_controller.rambaspec)
- [championat_viper](https://github.com/rambler-digital-solutions/generamba-catalog/blob/master/championat_viper/championat_viper.rambaspec)
- [mvvm_controller](https://github.com/rambler-digital-solutions/generamba-catalog/blob/master/mvvm_controller/mvvm_controller.rambaspec)
- [rviper_controller](https://github.com/rambler-digital-solutions/generamba-catalog/blob/master/rviper_controller/rviper_controller.rambaspec)
- [swifty_viper](https://github.com/rambler-digital-solutions/generamba-catalog/blob/master/swifty_viper/swifty_viper.rambaspec)
- [swifty_viper_OSX](https://github.com/rambler-digital-solutions/generamba-catalog/blob/master/swifty_viper_OSX/swifty_viper_OSX.rambaspec)
