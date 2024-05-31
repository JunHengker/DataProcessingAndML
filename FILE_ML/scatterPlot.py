import matplotlib.pyplot as plt

def scatter_plot(df, features, colors, label, title):
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    legends = []

    # scatter plot
    for i in range(len(df)):
        ax.scatter(df[i][features[0]], df[i][features[1]], df[i][features[2]], c=colors[i], s=df[i][features[3]] * 10, label=label[i], marker='o', alpha=0.5)
        legend = plt.Line2D([0], [0], linestyle="none", marker='o', color=colors[i], label=label[i], alpha=0.5)
        legends.append(legend)


    # label
    ax.set_xlabel(features[0])
    ax.set_ylabel(features[1])
    ax.set_zlabel(features[2])
    ax.set_title(title)

    # legend
    ax.legend(handles=legends)

    plt.show()

