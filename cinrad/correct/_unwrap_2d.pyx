
cdef extern from "unwrap_2d_ljmu.c":
    void unwrap2D(double* wrapped_image,
                  double* unwrapped_image,
                  unsigned char* input_mask,
                  int image_width, int image_height,
                  int wrap_around_x, int wrap_around_y)

def unwrap_2d(double[:, ::1] image,
              unsigned char[:, ::1] mask,
              double[:, ::1] unwrapped_image,
              wrap_around):
    """ 2D phase unwrapping. """
    unwrap2D(&image[0, 0],
             &unwrapped_image[0, 0],
             &mask[0, 0],
             image.shape[1], image.shape[0],
             wrap_around[1], wrap_around[0],
             )
