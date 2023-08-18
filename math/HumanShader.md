---
title: Human Shader
description: A human-powered shader
---

[Human Shader](https://humanshader.com/){:target="_blank"} was a project created by [Inigo Quilez](https://twitter.com/iquilezles){:target="_blank"}, where humans calculate the colors for each pixels of a 70x39 image, using no calculator or computer, just your mind, a pen and a paper.

To understand why this project is exciting you'll need to know what a shader is in the first place and then what the graphics card on your computer do.

## What is a shader?

A shader is a special kind of program that runs on your graphics card. It takes several parameters like texture, information about a 3D model, but mainly a pixel position, and then it calculates the color of that pixel. Colors in shaders are generally expressed as 4 numbers between 0 and 1, in the order of, amount of red, amount of green, amount of blue and opcacity. So for example, the opaque green color is represented as `(0.0, 1.0, 0.0, 1.0)`.

In terms of math, a simple shader can be represented as a function `f : R² -> R⁴`, so you can compute the color of each pixel by evaluating this function on every position of the screen. Generally the x and y parameters are between 0 and 1, 0 been the start of the screen and 1 the end of it.

So, how the shader function is defined? How can you calculate the color of a pixel based on its position?

A simple example can be a shader that only displays blue pixels:

$$ f(x, y) = (0.0, 0.0, 1.0, 1.0) $$

Another example is a shader that displays a white image that fades away as the x position increases:

$$ f(x, y) = (1.0, 1.0, 1.0, 1.0 - x) $$

But normally shaders are not defined like those pure math function, they are defined as a algorithm, a sequence of instructions, one of which will set the color of the pixel.

Another thing is that the colors that the Human Shader will use is a little diferent from the normal one. Instead of going from 0 to 1, it goes from 0 to 255, and no alpha component is needed because we will not use any transparency. So a color in Human Shader is something like `(255, 51, 196)`.

## What do a graphics card do?

After understanding what a shader is, understand what your graphics card do is simple. It just executes the shader function for each pixel of the screen at the same time.

So a powerful graphics card does each pixel calculation much faster than a regular one, so your FPS is increased, because FPS is the amount of frame per seconds that your graphics card can calculate on each second, frame being the image with all the calculated pixels on it that will be displayed on your screen.

For a game to run at 60FPS, each frame needs to be calculated at 16.6ms and so each pixel, in a 1080p resolution, in 0.000008005ms. So if your graphics card is not that great, it will take longer to calculate each pixel, and so, longer to calculate each frame.

## Human Shader

Now that you know what a shader is and what a graphics card do, imagine if instead of a graphics card calculating each pixel, a human did. That's exactly what the Human Shader project is.
1. Enter the [website](https://humanshader.com/){:target="_blank"}
2. Claim a pixel
3. Calculate the pixel color based on the coordinates you claimed using no computer or calculator
4. ???
5. Profit

Jokes aside, we are in the role of a graphics card right? So we already gathered the pixel coordinate, then what is the other thing we need so we can calculate the pixel color? The shader algorithm, right? The algorithm is [this one](https://humanshader.com/humanshader_worksheet.pdf).

To follow this instructions, 2 new operations were introduced.

### $a \rightarrow b$

This operation is simple, just replace the value of $a$ with the value of $b$.

Example:

$$ a=3 $$

$$ a \rightarrow a + 2 $$

At the end $a$ will be equal to 5.

<details>
  <summary>If you are wandering about why use this operator and not just a equal sign, expand this</summary>

  $$ a=3 $$

  $$ a = a + 2 $$

  Yes, this appers to be correct, but it is not. You are defining a value based on the value it self.
  , but this only make sense in programming.

  Recursion is kind of defining a thing based on itself, but in a diferent way.

  This is a valid recursion formula:

  $$ f(n + 1) = f(n) + 1 $$

  But only valid if you define a base case like:

  $$ f(0) = 1 $$

  Then you can infer the other value using the recursion formula

  $$ n = 0 $$

  $$ f(0 + 1) = f(0) + 1 $$

  $$ f(1) = 1 + 1 $$

  $$ f(1) = 2 $$

  This is a invalid recursion formula:

  $$ a = a + 2 $$

  The difference is simple, the valid one you define the value of one parameter based on the value of another parameter, the invalid one you define the value based on the value itself, but it doesn't make sense.
</details>

### $a\ |\ n$

This one is simple as well. You will remove the n last digits from a, but with **rounding**. You need to knwo how round works, so let me explain.

If you want to remove 2 digits from a number, get the first removed number, from left to right, and if this number is greater than 5, increment the number before it by 1, and if this number is less than or equal do 5, leave the number before it intact.

Examples:

$$ 12345\ |\ 2 = 123 $$

$$ 12367\ |\ 2 = 124 $$

So after understanding those operators, let calculate one pixel!

Choose a pixel coordinate, i will choose 0, 0. Then follow the instructions in the worksheet.

- A2

  $$ u = x - 36 $$

  $$ u = 0 - 36 $$

  $$ u = -36 $$

<br>

- A3

  $$ v = 18 - y $$

  $$ v = 18 - 0 $$

  $$ v = 18 $$

<br>

- A4

  $$ h = u^2+v^2 $$

  $$ h = (-36)^2+18^2 $$

  $$ h = 1620 $$

<br>

- D1

  $$ c = x + 4 \cdot y $$

  $$ c = 0 + 4 * 0 $$

  $$ c = 0 $$

<br>

- D2

  $$ R = 132+c $$

  $$ R = 132+0 $$

  $$ R = 132 $$

<br>

- D3

  $$ R = 192+c $$

  $$ R = 192+0 $$

  $$ R = 192 $$

<br>

- E1

  $$ R = 132 $$

<br>

- E2

  $$ B = 192 $$

<br>

- E3

  $$ G = (7 \cdot R + 3 \cdot B)\ |\ 1  $$

  $$ G = (7 \cdot 132 + 3 \cdot 192)\ |\ 1  $$

  $$ G = 1500\ |\ 1  $$

  $$ G = 150 $$

Yoah! We did it. The final color is (132, 150, 192). This pixel was easy, cuz we jumped right to the Section D, if we've choosen another pixel probabily we would have a harder time.

Now we just need to do this for the remaining 2729 pixels, easy job, right? Well, the goal of the Human Shader is multiple people calculating pixel colors at the same time.

After 72 hours from the launch of the project, the final shader is this one:

![Final Result](/assets/final_result.png)

On the website, you can slide across the timeline to see each pixel being calculated.

<br>
I've coded the shader algorithm and generated the image. This was the result:

![Final Result by Real Computer](/assets/final_result_computer.png)

After all this work, all i can say is that it was fun. Unfortunately i couldn't claim a pixel to calculate it, but i've choosen a pixel that was the wrong color and i calculated it with the right color!

This project was an analogy where the humanity is the graphics card and each people is a processing unit of a graphics card, where they collectively can calculate a bunch of pixels at the same time.

The creator of the Human Shader project, [Inigo Quilez](https://twitter.com/iquilezles){:target="_blank"}, is creating a video about this project at their's [YouTube Channel](https://www.youtube.com/c/InigoQuilez), check it out to see the creator's perpective of this project.