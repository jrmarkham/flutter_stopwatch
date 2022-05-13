# stopwatch

For sturture: I used my favorite design pattern of domain driven design. The cubit and model are fairly complete. I'd consider moving some code from the cubit into a mixin, but the class length is fewer than 50 lines so that is probaly unnessary. The display is broken into widgets. I'd probably create individual buttons on a production app and move some of the functions into mixins or utils.
