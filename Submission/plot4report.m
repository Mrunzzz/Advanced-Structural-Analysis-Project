figure()
syms x
L = 1.2369e+04
fplot(- 0.0018*x^2 + 47.7078*x - 223946.0, [0 L])
hold on
fplot([0 L/2 L],subs(- 0.0018*x^2 + 47.7078*x - 223946.0,[0 L/2 L]),"*")
h = plot([0 L/2 L],subs(- 0.0018*x^2 + 47.7078*x - 223946.0,[0 L/2 L]),"*")


xlabel("Coordinate x")
ylabel("Bending Moment Mz")