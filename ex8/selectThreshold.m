    cvPredictions = (pval < epsilon);
    tp = sum((cvPredictions == 1) & (yval == 1));
    fp = sum((cvPredictions == 1) & (yval == 0));
    fn = sum((cvPredictions == 0) & (yval == 1));
    prec = tp / (tp + fp);
    rec = tp / (tp + fn);
    F1 = 2 * prec * rec / (prec + rec);
